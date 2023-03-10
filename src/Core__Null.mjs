// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

function fromOption(option) {
  if (option !== undefined) {
    return Caml_option.valFromOption(option);
  } else {
    return null;
  }
}

function getWithDefault(value, $$default) {
  if (value !== null) {
    return value;
  } else {
    return $$default;
  }
}

function getExn(value) {
  if (value !== null) {
    return value;
  }
  throw {
        RE_EXN_ID: "Invalid_argument",
        _1: "Null.getExn: value is null",
        Error: new Error()
      };
}

function map(value, f) {
  if (value !== null) {
    return Curry._1(f, value);
  } else {
    return null;
  }
}

function mapWithDefault(value, $$default, f) {
  if (value !== null) {
    return Curry._1(f, value);
  } else {
    return $$default;
  }
}

function flatMap(value, f) {
  if (value !== null) {
    return Curry._1(f, value);
  } else {
    return null;
  }
}

export {
  fromOption ,
  getWithDefault ,
  getExn ,
  map ,
  mapWithDefault ,
  flatMap ,
}
/* No side effect */
