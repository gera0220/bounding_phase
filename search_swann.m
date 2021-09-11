function [y] = f(x)
  %y = (10 * x^3 + 3 * x^2 + x + 5)^2;
  y = (100 - x)^2; 
endfunction

function [] = swann(x0, delta, maxit)
    k = 1;
    x1 = x0 - abs(delta);
    x2 = x0 + abs(delta);
    if (f(x1) <= f(x0) && f(x0) <= f(x2))
        do
            x2 = x1 - 2^k * delta;
            if (f(x2) < f(x1))
                x1 = x2;
                k++;
            endif
        until(f(x2) > f(x1) || k > maxit)
        xs = x1;
    elseif (f(x1) >= f(x0) && f(x0) >= f(x2))
        x1 = x2;
        do
            x2 = x1 + 2^k * delta;
            if (f(x2) < f(x1))
                xs = x1;
                x1 = x2;
                k++;
            endif
        until(f(x2) > f(x1) || k > maxit)
    endif
    if(k <= maxit)
        printf("El valor óptimo se encuentra entre %d y %d. Se realizaron %d iteraciones.\n", x2, xs, k)
    else
        printf("Se alcanzó el número máximo de iteraciones sin llegar al resultado óptimo.\n")
    endif
endfunction