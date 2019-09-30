function [ proba ] = bayes_disc( x2,just_vmediap,scop )
    invscop = inv(scop);
    proba = exp((-1/2)*(x2'- just_vmediap)'*invscop*(x2'- just_vmediap))/sqrt((2*pi)*(det(scop)));
    
end

