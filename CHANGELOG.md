# CHANGELOG.md

## 0.1.0 (2023-09-12)

Features:

  - Initial commit

## 0.2.0 (2023-09-12)

Features:

  - Docs formatting changes

## 0.3.0 (2023-09-17)

Features:

  - Added some more exceptions
  - Expanded test data to ~1500 cases
  - Cleaned up docs

## 0.4.0 (2023-12-24)

Features:

  - Improved accuracy
  - Added `check` option to singularize/pluralize
  - Added singular?/1 and plural?/1 functions
  - Cleaned up test data

## 1.0.0 (2024-03-24)

Improvements:

  - Handful of small fixes
    - compound '-house'/'-pause' now fixed. Prevously `poolhouses` and `menopauses` would singularize to `poolhous` and `menopaus`, but they are now fixed.
  - Fixed unused alias warning
