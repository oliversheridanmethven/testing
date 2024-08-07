#!/usr/bin/env python3
"""
A collection of solvers.
"""
from common.logger import log
from abc import ABC, abstractmethod
from rubiks.shapes.shape import Path, Shape
from common.variables import variable_names_and_objects
from common.logger import progressbar
from functools import wraps


# TODO: move the profiler into my logger tool so it respects the verbosity level...


class Solver(ABC):
    """
    Solves a Rubik style puzzle.
    """

    @abstractmethod
    def solve(self, *args, start, target, **kwargs):
        ...


def check_solver_inputs(func):
    """Checks some basic function arguments for a solver and the trivial case."""

    @wraps(func)
    def check_solver_inputs_wrapper(*args, start, target, **kwargs):
        for name, variable in variable_names_and_objects(start, target):
            assert isinstance(variable, Shape), f"{name} is the wrong type."
        assert isinstance(start, type(target)), f"Our two shapes are different: {type(start) = } and {type(target) = }"
        return func(*args, start=start, target=target, **kwargs)

    return check_solver_inputs_wrapper


def next_generation_of_shapes_with_paths(shapes_and_paths):
    """
    Compute the next generation of shapes that can be achieved
    from the input group, noting the paths used.
    """
    assert isinstance(shapes_and_paths, dict)
    shapes_and_paths_next = {}
    for shape, path in progressbar(shapes_and_paths.items()):
        assert isinstance(shape, Shape)
        assert isinstance(path, Path)
        for move in shape.moves():
            moved = shape.move(move)
            moved_path = path.add(move=move, reverse=False)
            assert moved_path != path, f"The path has not changed."
            assert len(moved_path) == len(path) + 1, f"The path has not increased enough."
            shapes_and_paths_next[moved] = moved_path
    assert shapes_and_paths_next
    return shapes_and_paths_next


def next_generation_of_shapes_without_paths(shapes):
    """
    Compute the next generation of shapes that can be achieved
    from the input group.
    """
    assert isinstance(shapes, set)
    shapes_next = set()
    for shape in progressbar(shapes):
        assert isinstance(shape, Shape)
        for move in shape.moves():
            moved = shape.move(move)
            shapes_next.add(moved)
    assert shapes_next
    return shapes_next


if __name__ == "__main__":
    pass
