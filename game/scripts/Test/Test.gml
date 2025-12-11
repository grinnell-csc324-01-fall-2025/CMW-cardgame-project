// I found this file on pastebin at https://pastebin.com/96d19rdV, OP was
// chippylongstocking on reddit, so thanks for the framework pal.

// Base logic stolen from MinAssert. Thanks, MinAssert.
 
// Unit test checks are evoked by calling any of these class functions
// in the following manner:
/*
function MyTestClass() constructor {
  // Test name must end in "Test" or it will be assumed a helper function.
  function MakeSureCatsAreStillCatsTest(this_test_name) {
    Expect.IsTrue(this_test_name, "cat", "cat");
  }
}
*/
 
// Finally, to run all the tests and display results, execute the
// following code somewhere:
/*
RunAllTests(MyTestClass);
...
PrintAllTestResults();
*/
 
global.runner = ds_list_create();
 
function Test () constructor {
 
  __HandleUndefined = function(describe, expected, actual) {
    var result_value = 0;
    var result_notification = 0;
 
    if (describe == undefined) {
      result_value = "ERROR";
      result_notification = "ERROR: <describe> must be defined and a string";
      ds_list_add(global.runner, result_value, result_notification);
      return [true, result_value, result_notification];
    }
 
    if (expected == undefined) {
      result_value = "ERROR";
      result_notification = "ERROR: <expected> must be defined";
      result_value = describe + " [[" + result_value + "]] ";
      ds_list_add(global.runner, result_value, result_notification);
      return [true, result_value, result_notification];
    }
 
    if (actual == undefined) {
      result_value = "ERROR";
      result_notification = "ERROR: <actual> must be defined";
      result_value = describe + " [[" + result_value + "]] ";
      ds_list_add(global.runner, result_value, result_notification);
      return [true, result_value, result_notification];
    }
    return [false, result_value, result_notification];
  }
 
  /// @function     Equals(describe, expected, actual);
  /// @description  Equals(describe, expected, actual);
  /// @param describe The unit test description
  /// @param expected  The expected result
  /// @param actual  The actual result
  Equals = function(describe, expected, actual) {
    var undefined_result = __HandleUndefined(describe, expected, actual);
    if (undefined_result[0]) {
      return undefined_result[1];
    }
 
    var result_value = 0;
    var result_notification = 0;
 
    if (expected != actual) {
      result_value = "FAIL";
    } else {
      result_value = "PASS";
    }
    result_notification =
        result_value + ": Expected: " + string(expected) + " , actual: " + string(actual);
 
    result_value = describe + " [[" + result_value + "]] ";
    ds_list_add(global.runner, result_value, result_notification);
    return result_value;
  }
 
  /// @function     NotEquals(describe, expected, actual);
  /// @description  NotEquals(describe, expected, actual);
  /// @param describe The unit test description
  /// @param expected  The expected result
  /// @param actual  The actual result
  function NotEquals(describe, expected, actual) {
    var undefined_result = __HandleUndefined(describe, expected, actual);
    if (undefined_result[0]) {
      return undefined_result[1];
    }
 
    var result_value = 0;
    var result_notification = 0;
 
    if (expected != actual) {
      result_value = "PASS";
    } else {
      result_value = "FAIL";
    }
    result_notification =
        result_value + ": Expected: " + string(expected) + " , actual: " + string(actual);
 
    result_value = describe + " [[" + result_value + "]] ";
    ds_list_add(global.runner, result_value, result_notification);
    return result_value;
  }
 
  /// @function     IsGreaterThan(describe, highest, lowest);
  /// @description  IsGreaterThan(describe, highest, lowest);
  /// @param describe description
  /// @param expected highestnumber
  /// @param actual lowestnumber
  function IsGreaterThan(describe, expected, actual){
    var undefined_result = __HandleUndefined(describe, expected, actual);
    if (undefined_result[0]) {
      return undefined_result[1];
    }
    var result_value = 0;
    var result_notification = 0;
 
    if (expected <= actual) {
      result_value = "FAIL";
    } else {
      result_value = "PASS";
    }
    result_notification =
        result_value + ": Expected: " + string(expected) + " , actual: " + string(actual);
 
    result_value = describe + " [[" + result_value + "]] ";
    ds_list_add(global.runner, result_value, result_notification);
    return result_value;
  }
 
  /// @function     IsLessThan(describe, lowest, highest);
  /// @description  IsLessThan(describe, lowest, highest);
  /// @param describe The unit test description
  /// @param expected The expected result
  /// @param actual The actual result
  function IsLessThan(describe, expected, actual){
    var undefined_result = __HandleUndefined(describe, expected, actual);
    if (undefined_result[0]) {
      return undefined_result[1];
    }
 
    var result_value = 0;
    var result_notification = 0;
 
    if (expected >= actual) {
      result_value = "FAIL";
    } else {
      result_value = "PASS";
    }
    result_notification =
        result_value + ": Expected: " + string(expected) + " , actual: " + string(actual);
 
    result_value = describe + " [[" + result_value + "]] ";
    ds_list_add(global.runner, result_value, result_notification);
    return result_value;
  }
 
  __HandleUndefinedTrueFalse = function(describe, actual) {
    var result_value = 0;
    var result_notification = 0;
 
    if (describe == undefined) {
      result_value = "ERROR";
      result_notification = "ERROR: <describe> must be defined and a string";
      ds_list_add(global.runner, result_value, result_notification);
      return [true, result_value, result_notification];
    }
 
    if (actual == undefined) {
      result_value = "ERROR";
      result_notification = "ERROR: <actual> must be defined";
      result_value = describe + " [[" + result_value + "]] ";
      ds_list_add(global.runner, result_value,  result_notification);
      return [true, result_value, result_notification];
    }
 
    if (!is_bool(actual) && actual != 0 && actual != 1) {
      result_value = "ERROR";
      result_notification = "ERROR: <actual> must be a value that evaluates to true or false!";
      result_value = describe + " [[" + result_value + "]] ";
      ds_list_add(global.runner, result_value,  result_notification);
      return [true, result_value, result_notification];
    }
    return [false, result_value, result_notification];
  }
 
  /// @function         IsTrue(describe, actual);
  /// @description      IsTrue(describe, actual);
  /// @param describe
  /// @param {bool} actual
  IsTrue = function(describe, actual) {
    var undefined_result = __HandleUndefinedTrueFalse(describe, actual);
    if (undefined_result[0]) {
      return undefined_result[1];
    }
    var result_value = 0;
    var result_notification = 0;
 
    if (actual == false) {
      result_value = "FAIL";
      result_notification = "FAIL: Actual: " + string(actual) + " was false and should be true!";
    } else {
      result_value = "PASS";
      result_notification = "PASS: Actual: " + string(actual) + " is true";
    }
 
    result_value = describe + " [[" + result_value + "]] ";
    ds_list_add(global.runner, result_value, result_notification);
    return result_value;
  }
 
  /// @func     IsFalse(describe, actual);
  /// @desc     IsFalse(describe, actual);
  /// @param describe
  /// @param {bool} actual
  function IsFalse(describe, actual){
    var undefined_result = __HandleUndefinedTrueFalse(describe, actual);
    if (undefined_result[0]) {
      return undefined_result[1];
    }
    var result_value = 0;
    var result_notification = 0;
 
    if (actual == false) {
      result_value = "PASS";
      result_notification = "PASS: Actual: " + string(actual) + " was false!";
    } else {
      result_value = "FAIL";
      result_notification = "FAIL: Actual: " + string(actual) + " was true and should be false!";
    }
 
    result_value = describe + " [[" + result_value + "]] ";
    ds_list_add(global.runner, result_value, result_notification);
    return result_value;
  }
}
 
function RunAllTests(classname) {
  var object_instance = new classname();
  // GML supports code reflection, which is convenient because
  // it allows us to loop over all method names in a class.
  // This is a strange thing to do in general, but it makes
  // unit testing really fluent and nice.
  var method_names = variable_struct_get_names(object_instance);
 
  for (var i = 0; i < array_length(method_names); i++) {
    if (string_ends_with(method_names[i], "Test")) {
      var mymethod = variable_struct_get(object_instance, method_names[i])
      // Call each function that ends in "Test".
      mymethod(method_names[i]);
    }
  }
}
 
function PrintAllTestResults() {
    show_debug_message("=============UNIT TESTS BEGIN===========");
    for (var i = 0; i < ds_list_size(global.runner); i++) {
      show_debug_message(global.runner[| i]);
    }
    show_debug_message("===========UNIT TESTS COMPLETE==========");
}
 
// Syntactic sugar for writing Expect.Equals() etc.
#macro Expect global.__Expect
global.__Expect = new Test();