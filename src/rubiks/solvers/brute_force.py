#!/usr/bin/env python3

from rubiks.solvers.solver import Solver, next_generation_of_shapes_with_paths, check_solver_inputs
from rubiks.paths.path import Path
from common.logger import log


class BruteForce(Solver):
    """
    A brute force solver.
    """

    @check_solver_inputs
    def solve(self, *args, start, target, **kwargs):

        path = Path(start)
        shapes_and_paths = {start: path}

        turns = 0
        while True:
            if target in shapes_and_paths:
                path = shapes_and_paths[target]
                log.info(f"Found the path {path}")
                return path
            # We generate the next generation of shapes.
            log.info(f"Exploring all combinations with {turns = }")
            shapes_and_paths = next_generation_of_shapes_with_paths(shapes_and_paths)
            turns += 1


if __name__ == "__main__":
    pass
