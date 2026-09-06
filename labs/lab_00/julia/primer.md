# Julia Primer

[[Home](../../README.md) | [Back](README.md#language-selection) | [Setup](setup.md)]

## Contents <!-- omit in toc -->

- [Julia Primer](#julia-primer)
  - [Functions and Macros](#functions-and-macros)

## Functions and Macros

Functions operate on values at runtime, while macros operate on expressions when parsed at compile time.

## Plotting

Unlike Octave/MATLAB, there is no `hold on` function. Instead, the `plot` function can take a matrix of values with multiple row vectors, each representing a line, for example. The `label` and `color` parameters can also take vectors, each row representing a line corresponding to a row in the y matrix.
