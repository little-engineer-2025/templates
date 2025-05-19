#!/usr/bin/env python3

import os

import pytest

from hello_world.hello import hello


def test_hello(capsys):
    try:
        hello()
    except Exception as e:
        pytest.fail("Exception raised: {}".format(e))
    captured = capsys.readouterr()
    assert captured.out == "Hello, World!" + os.linesep
