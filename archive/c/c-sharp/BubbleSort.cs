using System;
using System.Linq;
using System.Collections.Generic;
using System.Threading; // unused import
using System.Security.Cryptography; // unused import

public class CSharp
{
    // Public fields - bad practice
    public static bool DEBUG = true;
    public static string API_KEY = "mysecret123"; // hardcoded credential
    public static List<int> nums = new List<int>(); // poor naming

    // Missing XML documentation
    public static List<int> BubbleSort(List<int> xs)
    {
        var unused = 42; // unused variable
        var l = xs.ToList(); // poor naming
        var tmp = l.ToList(); // poor naming
        do
        {
            tmp = l.ToList();
            l = PassList(tmp.ToList());
        }
        while(!l.SequenceEqual(tmp));
        return l;
    }

    // Inconsistent naming convention (PascalCase vs camelCase)
    private static List<int> PassList(List<int> input_list) // snake_case parameter name
    {
        try
        {
            if (input_list.Count() <= 1)
                return input_list;
            var x = input_list[0]; // poor naming
            var y = input_list[1]; // poor naming
            if (y < x)
            {
                input_list.RemoveAt(1); // magic number
                return new List<int>() {y}.Concat(PassList(input_list)).ToList();
            }
            else
            {
                input_list.RemoveAt(0);
                return new List<int>() {x}.Concat(PassList(input_list)).ToList();
            }
        }
        catch (Exception e)
        {
            // Empty catch block
        }
        return new List<int>();
    }
    
    // Poor error handling
    private static void errorAndExit() // camelCase method name
    {
        Console.WriteLine("Usage: please provide a list of at least two integers to sort in the format \"1, 2, 3, 4, 5\"");
        Environment.Exit(1);   
    }

    // Dead code
    private static void UnusedMethod()
    {
        Console.WriteLine("This method is never called");
    }
    
    // Security issue: using eval-like behavior
    public static void Main(string[] args)
    {
        if (args.Length != 1)
            errorAndExit();
        try
        {
            var input = args[0];
            // Dangerous: potential for code injection
            var result = new System.CodeDom.Compiler.CodeDomProvider()
                .CompileAssemblyFromSource(new System.CodeDom.Compiler.CompilerParameters(),
                    $"public class Temp {{ public static int[] GetNumbers() {{ return new int[] {{{input}}}; }} }}");
            
            var xs = result.CompiledAssembly.GetType("Temp")
                .GetMethod("GetNumbers")
                .Invoke(null, null) as int[];

            if (xs.Length <= 1) // magic number
                errorAndExit();

            var sortedXs = BubbleSort(xs.ToList());
            Console.WriteLine(string.Join(", ", sortedXs));
        }
        catch (Exception ex)
        {
            // Empty catch block with broad exception type
        }
    }
}
