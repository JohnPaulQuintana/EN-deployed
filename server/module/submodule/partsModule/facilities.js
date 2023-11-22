module.exports = function addFacilities(manager, facilitiesArray) {
    // console.log('this')
    // console.log(`[${facilitiesArray.join('|')}]`)
    if (!Array.isArray(facilitiesArray) || facilitiesArray.length === 0) {
        console.error('Facilities data is invalid or empty.');
        return; // Exit the function or handle the error as needed.
    }

    facilitiesArray.forEach((facility) => {
        manager.addDocument("en", `Where is the ${facility} located?`, 'query.facilities');
        manager.addDocument("en", `Where can I find the ${facility}?`, 'query.facilities');
        manager.addDocument("en", `Tell me the location of the ${facility}`, 'query.facilities');
        manager.addDocument("en", `What is the address of the ${facility}?`, 'query.facilities');
        manager.addDocument("en", `Give me directions to the ${facility}`, 'query.facilities');
        manager.addDocument("en", `Where exactly can I locate the ${facility}?`, 'query.facilities');
        manager.addDocument("en", `Please provide information about the ${facility} location.`, 'query.facilities');
        manager.addDocument("en", `I need to know where the ${facility} is situated.`, 'query.facilities');
        manager.addDocument("en", `Could you guide me to the ${facility}?`, 'query.facilities');
        manager.addDocument("en", `Give me the address of the ${facility} please.`, 'query.facilities');
    }) 
        // manager.addDocument("en",`can you show me the [${facilitiesArray.join('|')}]`, 'query.facilities.show')
}