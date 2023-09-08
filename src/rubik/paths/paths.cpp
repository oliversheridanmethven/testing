#include "paths.hpp"
#include <algorithm>

Path Path::add(const Move &move, const bool reverse) const {
    Path result = *this;
    result.push_back({move, reverse});
    return result;
}

Path Path::reversed(void) const {
    Path result = *this;
    std::ranges::reverse(result);
    for (auto &[move, reverse]: result) {
        reverse = not reverse;
    }
    return result;
}