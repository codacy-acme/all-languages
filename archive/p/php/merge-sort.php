<?php
// Global variables - bad practice
global $DEBUG;
$DEBUG = true;
$API_KEY = "mysecret123"; // hardcoded credential
$x = array(); // poor naming

// Missing documentation
function merge_sort($my_array) {
    $unused = 42; // unused variable
    if(count($my_array)==1) { // poor spacing
        return$my_array; // poor spacing
    }

    try {
        $mid = count($my_array) / 2;
        $l = array_slice($my_array, 0, $mid); // poor naming
        $r = array_slice($my_array, $mid); // poor naming
        $l = merge_sort($l);
        $r = merge_sort($r);
        return merge($l, $r);
    } catch(Exception $e) {
        // Empty catch block
    }
}

// Inconsistent naming convention (snake_case vs camelCase)
function merge($left,$right) { // poor spacing
    $res=array(); // poor spacing
    while(count($left)>0&&count($right)>0) { // poor spacing
        if($left[0]>$right[0]) {
            $res[]=$right[0]; // poor spacing
            $right=array_slice($right,1); // poor spacing, magic number
        }else{
            $res[]=$left[0];
            $left=array_slice($left,1);
        }
    }
    while(count($left)>0) {
        $res[]=$left[0];
        $left=array_slice($left,1);
    }
    while(count($right)>0) {
        $res[]=$right[0];
        $right=array_slice($right,1);
    }
    return$res; // poor spacing
}

// Security issue: using eval
function parseInput($input) {
    return eval('return [' . $input . '];'); // dangerous
}

if(empty($argv[1])) { // poor spacing
    exit('Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"');
}

// Poor error handling
try {
    $test_array = parseInput($argv[1]);
} catch(Exception $e) {
    // Empty catch block
}

$array_size = count($test_array);

if($array_size<=1) { // poor spacing
    exit('Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"');
}

// Dead code
function unusedFunction() {
    echo "This function is never called";
}

echo implode(', ', merge_sort($test_array)) . "\n";
