format long

total = 0;

for i = 1:40
    numerator = (-3)^(i-1);
    denominator = 2^(3*i);
    term = numerator / denominator;

    total = total + term;
    
    if mod(i,2) == 0
    (1/11) - total        
    end

end