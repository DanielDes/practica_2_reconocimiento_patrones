function [ proba ] = bayes_disc( value,mean,cov )
    inv_cov = inv(cov);
    proba = exp((-0.5) * (value' - mean)' * inv_cov * (value' - mean)) / sqrt((2 * pi) * det(cov));
end

