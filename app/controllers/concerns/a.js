let a = "g";

for(let i = "a".charCodeAt(); i <= "z".charCodeAt(); i++) {
    if (a.charCodeAt() == i) {
        console.log(`${i} is the character code of ${String.fromCharCode(i).toUpperCase()}`);
        console.log(`Binary representation: ${i.toString(2)}`);
    }
}
