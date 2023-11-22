module.exports = function addFacilities(manager, facilitiesArray) {
    // console.log('this')
    // console.log(`[${facilitiesArray.join('|')}]`)
    if (!Array.isArray(facilitiesArray) || facilitiesArray.length === 0) {
        console.error('Facilities data is invalid or empty.');
        return; // Exit the function or handle the error as needed.
    }

    facilitiesArray.forEach((facility) => {
        //adding intity
        // manager.addNamedEntityText('product', product, ['en'], [product])
        // manager.addDocument("en", `How many %product% are in stock?`, "asking.products.search", {product: product});
        manager.addNamedEntityText('facility', facility, ['en'], [facility])
        manager.addDocument("en", `Where is the %facility% located?`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `Where can I find the %facility%?`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `Tell me the location of the %facility%`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `What is the address of the %facility%?`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `Give me directions to the %facility%`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `Where exactly can I locate the %facility%?`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `Please provide information about the %facility% location.`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `I need to know where the %facility% is situated.`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `Could you guide me to the %facility%?`, 'query.facilities', {facility: facility});
        manager.addDocument("en", `Give me the address of the %facility% please.`, 'query.facilities', {facility: facility});
        
        //split the word int like this room 102 to ["room", "102"]
        // const wordsArray = facility.split(" ");
        // wordsArray.forEach((fac) => {
        //     console.log(fac)
        //     manager.addDocument("en", `Where is the %fac% located?`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `Where can I find the %fac%?`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `Tell me the location of the %fac%`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `What is the address of the %fac%?`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `Give me directions to the %fac%`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `Where exactly can I locate the %fac%?`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `Please provide information about the %fac% location.`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `I need to know where the %fac% is situated.`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `Could you guide me to the %fac%?`, 'query.facilities', {fac: fac});
        //     manager.addDocument("en", `Give me the address of the %fac% please.`, 'query.facilities', {fac: fac});
        // })
    }) 
        // manager.addDocument("en",`can you show me the [${facilitiesArray.join('|')}]`, 'query.facilities.show')
}