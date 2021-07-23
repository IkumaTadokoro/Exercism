//
// This is only a SKELETON file for the 'Gigasecond' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const gigasecond = (input) => {
    const gigaSecond = 1_000_000_000
    const date = new Date(input)
    date.setSeconds(date.getSeconds() + gigaSecond)
    return date
};
