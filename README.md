# Collatz-conjecture-optimization

Section 1: Design the main code of the Collatz problem
Based on the given process of the Collatz problem, we defined certain parameters and initial condition. Because a positive integer is an unknown parameter, we defined it as “n”. Then, the interval of the trend is under “N” and “N” is an unknown parameter which related to the value of “n”, so we defined it as “N = n + 50”. In addition, we defined “S” as a matrix which should store the number of steps it takes to reach 1 when starting from n. From the process of the Collatz problem, it is easy to know that the code operation method should be a “while” loop which is included by a “for” loop and should contain conditional statements that includes “n is even”, “n is odd” or “n equals 1”. Finally, we use “plot” to visualize the trend of S(n).

Section 2: The Least Squares Method
This section, we introduce a new MATLAB code “lsqcurvefit” and “lsqcurvefit” can be used to calculate the minimum sum of squares of the residuals ∑𝑁 (𝑓(𝑛) − 𝑆(𝑛))2
with initial vector [1,1]. Then, we visualize the function “yn”.
Section 3: The 𝑳𝟏 fit

Although this section is similar to the section 2, but we used another method to calculate
the absolute value of the residuals ∑𝑁 |𝑓(𝑛) − 𝑆(𝑛)| because of the limitation of 𝑛=1
MATLAB code “lsqcurvefit”. Hence, we setup “beta” as coefficients of the 𝑳𝟏 equation and we used “fminsearch” to find the minimum value of function begin from a0 = [1,1]. Then, we visualize the function “y”.

Section 4: Mixed model
In this section, we mixed both functions and included the linear trend for additional parameters. After copied the code from section 3, we added another linear trend function. Again, we used “fminsearch” to find the minimum starting from [1,1,50,-1] like what we did in section 3. After visualizing the model, we have current parameters for presentation as output.

Section 5: Output equations
Based on the project requirement, we need to output equations. Hence, we defined 8 new parameters from “p_1” to “p_8” to store the coefficients of these equations. Then, we used “if” statement to output different conditions’ equations (“+” or “-”) because the type of outputs is string.
