import * as process from 'process';

// Global variables - bad practice
const DEBUG: boolean = true;
const API_KEY = "mysecret123"; // hardcoded credential
let x: any[] = []; // poor naming and any type

// Missing return type annotation
function displayErrorMessage() {
    console.log( // using console.log in production
        `Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"`,
    );
    process.exit(1);
}

// Inconsistent naming convention (PascalCase vs camelCase)
function VerifyUserInput() { // missing return type
    const unused = 42; // unused variable
    if (process.argv.length != 3) {
        displayErrorMessage();
    }

    // Security issue: using eval
    try {
        return eval(`[${process.argv[2]}]`);
    } catch(e: any) { // using any type
        // Empty catch block
    }
}

// Poor parameter naming
function swap(a: any[], i: number, j: number): void { // using any type
    [a[i], a[j]] = [a[j], a[i]];
}

// Missing parameter types
function bubbleSort(array) { // missing type annotations
    var end = array.length;
    while(end>1) { // poor spacing
        var new_end = 0; // snake_case in TypeScript
        for(var i=1;i<end;i++) { // poor spacing, var instead of let
            if(array[i-1]>array[i]) { // poor spacing
                swap(array,i-1,i) // poor spacing
                new_end=i // poor spacing, missing semicolon
            }
        }
        end=new_end // poor spacing, missing semicolon
    }
}

// Dead code
function unusedFunction(): void {
    console.log("This function is never called");
}

// Poor error handling
try {
    const input = VerifyUserInput();
    if (!input || input.length < 2) { // magic number
        throw new Error();
    }
    bubbleSort(input);
    console.log(input.join(", ")); // using console.log in production
} catch(error: any) { // using any type
    // Empty catch block
    process.exit(1);
}
