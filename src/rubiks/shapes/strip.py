#!/usr/bin/env python3
from .shape import Shape, _array_from_faces_at_end
import numpy as np


class Strip(Shape):
    """
    A Nx1x0 set of square tiles with N >=2

     ____
    |    |
    |    |
     ----
    |    |
    |    |
     ----
    |    |
    :    :
    :    :
    :    :
    |    |
     ----
    |    |
    |    |
     ----

    """

    @_array_from_faces_at_end
    def __init__(self, *args, N, **kwargs):
        super().__init__(*args, N=N, **kwargs)
        assert N >= 2, "A strip must be longer than 2."
        for colour in self._colours:
            self._faces.append([[colour.value] for i in range(N)])
            if len(self._faces) == 2:
                break
        assert len(self._faces) == 2, f"A {type(self).__name__} must have only 2 faces."
        for face in self._faces:
            assert np.shape(face) == (N, 1), f"A {type(self).__name__} face must only contain 2 tiles."

    _moves = NotImplemented
    _reverse_moves = NotImplemented
    _commutative_moves = NotImplementedError
    _invariant_tile_positions = NotImplementedError


if __name__ == "__main__":
    pass
