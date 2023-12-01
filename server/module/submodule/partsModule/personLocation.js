module.exports = function addPersonLocation(manager, persons) {
    // manager.addDocument("en", `What's the location of [${persons.join('|')}]?`, 'query.persons.facilities.show');
    // manager.addDocument("en", `Can you tell me where to find [${persons.join('|')}]?`, 'query.persons.facilities.show');
    // manager.addDocument("en", `I'm looking for [${persons.join('|')}]'s location. Where can I find them?`, 'query.persons.facilities.show');
    // manager.addDocument("en", `Could you direct me to [${persons.join('|')}]? I need to know their location.`, 'query.persons.facilities.show');
    // manager.addDocument("en", `Tell me the whereabouts of [${persons.join('|')}] please.`, 'query.persons.facilities.show');
    // manager.addDocument("en", `I'd like to know where [${persons.join('|')}] is located. Can you help?`, 'query.persons.facilities.show');
    // manager.addDocument("en", `Where can I locate [${persons.join('|')}] on campus?`, 'query.persons.facilities.show');
    // manager.addDocument("en", `Can you provide information on the location of [${persons.join('|')}]?`, 'query.persons.facilities.show');
    // manager.addDocument("en", `I'm searching for the location of [${persons.join('|')}] on campus.`, 'query.persons.facilities.show');
    // manager.addDocument("en", `How can I find [${persons.join('|')}]? Where are they located?`, 'query.persons.facilities.show');    

    persons.forEach((person) => {
        manager.addNamedEntityText('person', person, ['en'], [person])
        manager.addDocument("en", `What's can i find sir %person%?`, 'query.persons.facilities.show', {person : person});
        // manager.addDocument("en", `Where can i find maam %person%?`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `What's the location of %person%?`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `Can you tell me where to find %person%?`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `I'm looking for %person%' location. Where can I find them?`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `im looking for %person%'`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `Could you direct me to %person%? I need to know their location.`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `Tell me the whereabouts of %person% please.`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `I'd like to know where %person% is located. Can you help?`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `Where can I locate %person% on campus?`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `Can you provide information on the location of %person%?`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `I'm searching for the location of %person% on campus.`, 'query.persons.facilities.show', {person : person});
        manager.addDocument("en", `How can I find %person%? Where are they located?`, 'query.persons.facilities.show', {person : person});  
    }) 
}