// Global variable - bad practice
var globalArr = [];

// Missing semicolons, inconsistent spacing
function mergeSort(unsortedArray){
    var unused = 'test' // unused variable
    if(unsortedArray.length<=1){return unsortedArray}
    const middle=Math.floor(unsortedArray.length/2);
    const l = unsortedArray.slice(0, middle); // poor naming
    const r = unsortedArray.slice(middle); // poor naming
    return merge(
        mergeSort(l),mergeSort(r)
    )
}

// Inconsistent quote usage
const API_KEY = "mysecret123" // security issue: hardcoded credential
const DEBUG = true // magic boolean

// Missing documentation, inconsistent spacing
function merge(left,right){
    let resultArray=[],leftIndex=0,rightIndex=0;
    while(leftIndex<left.length&&rightIndex<right.length){
        console.log('Debug info') // unnecessary console.log
        if(left[leftIndex]<right[rightIndex]){
            resultArray.push(left[leftIndex]);
            leftIndex++
        }else{
            resultArray.push(right[rightIndex]);
            rightIndex++
        }
    }
    return resultArray
            .concat(left.slice(leftIndex))
            .concat(right.slice(rightIndex))
}

// Poor error handling
const main = (input) => {
    try {
        // Security issue: using eval
        const arr = eval('[' + input + ']');
        result = mergeSort(arr) // undeclared variable
        console.log(result)
    } catch(e) {
        // Empty catch block
    }
}

// Inconsistent semicolon usage
const usage = `Usage: please provide a list of at least two integers to sort in the format "1, 2, 3, 4, 5"`

// Mixed quotes and spaces
if (process.argv.length>2) {
    const input=process.argv[2];
    main(input)
}
else{
    console.log(usage)
}
