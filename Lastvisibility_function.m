% Define the visibility function
function a_t = Lastvisibility_function(t)
    mod_t = mod(t, 0.2);
    mod_t = round(mod_t, 2);
    if mod_t < 0.1
        a_t = 1 - 10 * mod_t;
    elseif mod_t == 0.1
        a_t = 0;
    else
        a_t = -1;
    end
end


