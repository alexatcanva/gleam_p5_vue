import * as $string from "../../gleam_stdlib/gleam/string.mjs";
import { toList, makeError, isEqual } from "../gleam.mjs";

export function equal(a, b) {
  let $ = isEqual(a, b);
  if ($) {
    return undefined;
  } else {
    throw makeError(
      "todo",
      "gleeunit/should",
      14,
      "equal",
      $string.concat(
        toList([
          "\n\t",
          $string.inspect(a),
          "\n\tshould equal \n\t",
          $string.inspect(b),
        ]),
      ),
      {}
    )
  }
}

export function not_equal(a, b) {
  let $ = !isEqual(a, b);
  if ($) {
    return undefined;
  } else {
    throw makeError(
      "todo",
      "gleeunit/should",
      28,
      "not_equal",
      $string.concat(
        toList([
          "\n",
          $string.inspect(a),
          "\nshould not equal \n",
          $string.inspect(b),
        ]),
      ),
      {}
    )
  }
}

export function be_ok(a) {
  if (a.isOk()) {
    let value = a[0];
    return value;
  } else {
    throw makeError(
      "todo",
      "gleeunit/should",
      41,
      "be_ok",
      $string.concat(toList(["\n", $string.inspect(a), "\nshould be ok"])),
      {}
    )
  }
}

export function be_error(a) {
  if (!a.isOk()) {
    let error = a[0];
    return error;
  } else {
    throw makeError(
      "todo",
      "gleeunit/should",
      49,
      "be_error",
      $string.concat(toList(["\n", $string.inspect(a), "\nshould be error"])),
      {}
    )
  }
}

export function be_true(actual) {
  let _pipe = actual;
  return equal(_pipe, true);
}

export function be_false(actual) {
  let _pipe = actual;
  return equal(_pipe, false);
}

export function fail() {
  return be_true(false);
}
