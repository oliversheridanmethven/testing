#include "testing/testing.h"
#include "rubik/shapes/volume.hpp"
#include <ranges>

template<typename S>
class ShapeTest : public testing::Test {
};

using ShapeTypes = ::testing::Types<Volume>;
TYPED_TEST_SUITE(ShapeTest, ShapeTypes);

TYPED_TEST(ShapeTest, printing) {
    TypeParam shape;
    LOG_DEBUG << shape;
}

TYPED_TEST(ShapeTest, equality) {
    TypeParam shape_1, shape_2;
    ASSERT_EQ(shape_1, shape_2);
}

TYPED_TEST(ShapeTest, hashing) {
    TypeParam shape_1, shape_2;
    ASSERT_EQ(std::hash<TypeParam>{}(shape_1), std::hash<TypeParam>{}(shape_2));
}

TYPED_TEST(ShapeTest, after_move) {
    TypeParam shape_1, shape_2;
    for (auto move: shape_1.moves()) {
        shape_2 = shape_1.move(move);
        ASSERT_NE(shape_1, shape_2);
        ASSERT_NE(std::hash<TypeParam>{}(shape_1), std::hash<TypeParam>{}(shape_2));
    }
}

TYPED_TEST(ShapeTest, moves_equality) {
    TypeParam shape;
    auto moves = shape.moves();
    for (size_t i = 0; i < moves.size(); i++) {
        for (size_t j = 0; j < moves.size(); j++) {
            if (i == j) {
                ASSERT_EQ(moves.at(i), moves.at(j));
            } else {
                ASSERT_NE(moves.at(i), moves.at(j));
            }
        }
    }
}

TYPED_TEST(ShapeTest, single_moves) {
    TypeParam shape_1, shape_2, shape_3;
    for (auto move: shape_1.moves()) {
        shape_3 = shape_2.move(move);
        ASSERT_NE(shape_3, shape_2);
        ASSERT_EQ(shape_1, shape_2);
    }
}

TYPED_TEST(ShapeTest, reverse_moves) {
    TypeParam shape_1, shape_2, shape_3;
    for (auto move: shape_1.moves()) {
        shape_2 = shape_1.move(move);
        bool reverse = true;
        shape_3 = shape_2.move(move, reverse);
        ASSERT_NE(shape_1, shape_2);
        ASSERT_EQ(shape_1, shape_3);
    }
}

TYPED_TEST(ShapeTest, compound_moves) {
    TypeParam shape_1, shape_2, shape_3, shape_4;
    for (auto reverse: {true, false}) {
        for (auto move_1: shape_1.moves()) {
            for (auto move_2: shape_1.moves()) {
                shape_2 = shape_1.move(move_1, reverse);
                shape_3 = shape_2.move(move_2, reverse);
                shape_4 = shape_1.move({move_1, move_2}, reverse);
                ASSERT_EQ(shape_3, shape_4);
            }
        }
    }
}

TYPED_TEST(ShapeTest, multiple_moves) {
    TypeParam shape_1, shape_2, shape_3;
    for (auto reverse: {true, false}) {
        for (auto move_1: shape_1.moves()) {
            for (auto move_2: shape_1.moves()) {
                shape_2 = shape_1.move({move_1, move_2}, reverse);
                shape_3 = shape_1.move(move_1, reverse).move(move_2, reverse);
                ASSERT_EQ(shape_2, shape_3);
            }
        }
    }
}

TYPED_TEST(ShapeTest, double_moves) {
    TypeParam shape;
    for (auto direction: {true, false}) {
        auto other_direction = not direction;
        for (auto move_1: shape.moves()) {
            for (auto move_2: shape.moves()) {
                auto shape_moved_once = shape.move(move_1, direction);
                auto shape_moved_twice = shape_moved_once.move(move_2, direction);
                if (shape.reverse_of(move_1) == move_2) {
                    ASSERT_EQ(shape_moved_twice, shape.solved_config());
                } else {
                    ASSERT_NE(shape_moved_twice, shape.solved_config());
                    ASSERT_NE(shape_moved_twice, shape_moved_once);
                }
                auto shape_moved_twice_reverted = shape_moved_twice.move(move_2, other_direction);
                ASSERT_EQ(shape_moved_twice_reverted, shape_moved_once);
                auto shape_reverted_in_order = shape_moved_twice.move({move_2, move_1}, other_direction);
                ASSERT_EQ(shape_reverted_in_order, shape);
                auto shape_reverted_out_of_order = shape_moved_twice.move({move_1, move_2}, other_direction);
                if (move_1 == move_2 or shape.reverse_of(move_1) == move_2 or shape.commutative(move_1, move_2)) {
                    ASSERT_EQ(shape_reverted_out_of_order, shape);
                } else {
                    ASSERT_NE(shape_reverted_out_of_order, shape);
                }

            }
        }
    }
}

TYPED_TEST(ShapeTest, rotational_symmetry) {
    TypeParam shape;
    for (auto direction: {true, false}) {
        auto other_direction = not direction;
        for (auto move: shape.moves()) {
            // The two-fold symmetry
            auto moved = shape.move({move, move}, direction);
            auto moved_reverse = shape.move({move, move}, other_direction);
            ASSERT_EQ(moved, moved_reverse);
            // The four-fold symmetry
            auto moved_fully = shape.move({move, move, move, move}, direction);
            ASSERT_EQ(shape, moved_fully);
        }
    }
}

TYPED_TEST(ShapeTest, shuffle) {
    for (size_t turns = 0; turns < 10; turns++) {
        TypeParam shape;
        auto [shuffled, path] = shape.shuffle(turns, std::nullopt);
        LOG_INFO << "The target shuffled cube is:" << shuffled;
        LOG_DEBUG << "Obtained by:" << path;
        auto moved = shape;
        LOG_DEBUG << "The starting configuration is: " << moved;
        size_t turn = 0;
        for (auto [move, reverse]: path) {
            LOG_DEBUG << "Turn = " << turn++ << move << (reverse ? " in reverse" : "");
            moved = moved.move(move, reverse);
            LOG_DEBUG << "The moved configuration is: " << moved;
        }
        LOG_INFO << "The final moved configuration is: " << moved;
        LOG_INFO << "The target configuration is: " << shuffled;
        ASSERT_EQ(moved, shuffled) << "We should have recovered our target configuration.";
        auto reverted = moved;
        for (auto [move, other_direction]: path.reversed()) {
            LOG_DEBUG << "Turn = " << turn-- << move << (other_direction ? " in reverse" : "");
            reverted = reverted.move(move, other_direction);
        }
        ASSERT_EQ(reverted, shape);
    }
}

TYPED_TEST(ShapeTest, shuffle_seeding) {
    TypeParam shape_1, shape_2, shuffle_1, shuffle_2;
    Path path_1, path_2;
    auto turns = 10;
    const std::vector<typename TypeParam::Seed> seeds = {std::nullopt, 0, 1, 2};
    for (const auto &seed: seeds) {
        while (true) {
            std::tie(shuffle_1, path_1) = shape_1.shuffle(turns, seed);
            std::tie(shuffle_2, path_2) = shape_2.shuffle(turns, seed);
            if (shuffle_1 != shape_1 and shuffle_2 != shape_2) {
                break;
            }
        }

        if (seed.has_value()) {
            ASSERT_EQ(path_1, path_2);
            ASSERT_EQ(shuffle_1, shuffle_2);
        } else {
            ASSERT_NE(path_1, path_2);
        }
    }
}
