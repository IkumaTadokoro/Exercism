//
// This is only a SKELETON file for the 'Gigasecond' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const gigasecond = (date) => {
    date.setSeconds(date.getSeconds() + 1_000_000_000)
    return date
};
