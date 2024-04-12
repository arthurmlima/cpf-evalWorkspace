function chi2Value = mychi2(imageData)
    % Compute the histogram of the image data
    [observedFrequencies, ~] = imhist(imageData);

    % Calculate the expected frequencies assuming a uniform distribution
    totalPixels = sum(observedFrequencies);
    expectedFrequencies = totalPixels / numel(observedFrequencies) * ones(size(observedFrequencies));

    % Calculate the chi-squared value
    chi2Value = sum(((observedFrequencies - expectedFrequencies).^2) ./ expectedFrequencies);
end