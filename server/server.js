const express = require("express");
const cors = require("cors");
const natural = require('natural');

const keywordExtractor = require("./module/keywordsExtractor");
// const exousiaResponse = require("./module/openAI");
const nlp = require("./module/nlpManager");
const Filter = require("bad-words");
// const spellchecker = require('spell-checker-js');
const app = express();
app.use(cors());
app.use(express.json());

const badWords = new Filter();
//hello message
app.get('/', async (req, sendToClient) => {
    sendToClient.status(200).send({ navi: 'Welcome to Exousia Navi!' });
})
app.post("/nlp", async (req, sendToClient) => {
    try {
        const question = req.body.prompt;
        const fac = req.body.facilities;
        const per = req.body.persons;
        let nlpResponse = '';
        const tokenizer = new natural.WordTokenizer();
        // const spellcheck = new natural.Spellcheck();
        // console.log(req.body.facilities)
        if (badWords.isProfane(question)) {
          console.log("Profanity detected");
          nlpResponse = [{flag:'false',query:'badwords',answer:'bad words detected',data:false, 'entity':'badwords'}]
        } else {
          console.log("Text is clean.");
            const words = tokenizer.tokenize(question) // make words [ 'who', 'is', 'jaypee' ]
            console.log(words)
          nlpResponse = await processNLPQuestion(question, per, fac);// call the processNLPQuestion
        }
        
        console.log(nlpResponse);
        //send it back the response to a client request
        sendToClient.status(200).send({ navi: nlpResponse });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Something went wrong" });
    }
});

// responsible for retuuning response on a controller
async function processNLPQuestion(question, persons, facilities) {
    try {
        const response = await nlp.trainAndProcessNLP(
            question,
            persons,
            facilities
        );
        console.log('Intent')
        console.log(response.intent)
        switch (response.intent) {
            case "greetings.hello":
                console.log(response.answer);
                // greet them
                return [
                    {
                        flag: "false",
                        query: "greetings",
                        answer: response.answer,
                        data: false,
                    },
                ];

            case "greetings.asking":
                console.log(response.answer);
                // they call your name
                return [
                    {
                        flag: "false",
                        query: "greetings",
                        answer: response.answer,
                        data: false,
                    },
                ];

            // facilities
            case "query.facilities":
                console.log(response.answer);
                var datas = await processKeywordsAndTranslate(question);
                if (datas) {
                    return [
                        {
                            flag: "false",
                            query: "facilities.found",
                            entity: response.intities,
                            answer: response.answer,
                            data: datas,
                        },
                    ];
                } else {
                    return [
                        {
                            flag: "false",
                            query: "facilities.not",
                            entity: response.intities,
                            answer: "oh!, sorry looks like i dont have the details!",
                            data: false,
                        },
                    ];
                }
            // return only the maps
            case "query.facilities.show":
                console.log(response.answer);
                var datas = await processKeywordsAndTranslate(question);
                if (datas) {
                    return [
                        {
                            flag: "true",
                            query: "facilities.found",
                            entity: response.intities,
                            answer: response.answer,
                            data: datas,
                        },
                    ];
                } else {
                    return [
                        {
                            flag: "true",
                            query: "facilities.not",
                            entity: response.intities,
                            answer: "im not able to show you the facilities right now!",
                            data: false,
                        },
                    ];
                }
            // persons located
            case "query.persons":
                console.log(response.answer);
                var datas = await processKeywordsAndTranslate(question);
                if (datas) {
                    return [
                        {
                            flag: "false",
                            query: "persons.found",
                            entity: response.intities,
                            answer: response.answer,
                            data: datas,
                        },
                    ];
                } else {
                    return [
                        {
                            flag: "false",
                            query: "persons.not",
                            entity: response.intities,
                            answer: "im sorry i dont know that persons is!",
                            data: false,
                        },
                    ];
                }
            // persons position located
            case "query.persons.position":
                console.log(response.answer);
                var datas = await processKeywordsAndTranslate(question);
                if (datas) {
                    return [
                        {
                            flag: "false",
                            query: "persons.position.found",
                            entity: response.intities,
                            answer: response.answer,
                            data: datas,
                        },
                    ];
                } else {
                    return [
                        {
                            flag: "false",
                            query: "persons.position.not",
                            entity: response.intities,
                            answer: "im sorry i dont know that persons is!",
                            data: false,
                        },
                    ];
                }
            // persons located
            case "query.persons.facilities.show":
              console.log(response.answer)
              var datas = await processKeywordsAndTranslate(question);
                if (datas) {
                    return [
                        {
                            flag: "false",
                            query: "persons.location.found",
                            entity: response.intities,
                            answer: response.answer,
                            data: datas,
                        },
                    ];
                } else {
                    return [
                        {
                            flag: "false",
                            query: "persons.location.not",
                            entity: response.intities,
                            answer: "im sorry i dont know that persons is!",
                            data: false,
                        },
                    ];
                }
            // querying database continuation
            case "query.database":
                console.log(response.answer);
                var datas = await processKeywordsAndTranslate(question);
                if (datas) {
                    return [
                        {
                            flag: "true",
                            query: "continue",
                            entity: response.intities,
                            answer: response.answer,
                            data: datas,
                        },
                    ];
                } else {
                    return [
                        {
                            flag: "true",
                            query: "continue",
                            entity: response.intities,
                            answer: "i didnt know that, my data is limited!",
                            data: false,
                        },
                    ];
                }
            // conversation stop
            case "thanks":
                console.log(response.answer);
                var datas = await processKeywordsAndTranslate(question);
                if (datas) {
                    // show the popup asking for hear querying or not means cancel
                    return [
                        {
                            flag: "false",
                            query: "goodbye",
                            entity: response.intities,
                            answer: response.answer,
                            data: datas,
                        },
                    ];
                } else {
                    return [
                        {
                            flag: "false",
                            query: "goodbye",
                            entity: response.intities,
                            answer: "i didnt know that person!",
                            data: false,
                        },
                    ];
                }
            default:
                // await processKeywordsAndTranslate(question);
                console.log("accuracy: " + 0);
                return [
                    {
                        flag: "false",
                        query: "404",
                        entity: response.intities,
                        answer: "Sorry my knowledge is limited, i cant help you with that!",
                        data: "",
                    },
                ];

            // return ["true",await processKeywordsAndTranslate(question)]; // Add a default response here or modify it as per your requirement
            // return []
        }
    } catch (error) {
        console.log(error);
    }
}

const processKeywordsAndTranslate = async (question) => {
    try {
        console.log('ito na')
        console.log(question)
        const keywordsObject = await keywordExtractor.extractKeywords(question);
        // console.log(keywordsObject['data']);

        const data = await keywordsObject.data;
        
        console.log(data);
        if (data && Array.isArray(data) && data.length > 0) {
            let separatedText = "";
            for (const objects of data) {
                for (const key of Object.keys(objects)) {
                    const value = objects[key];
                    separatedText += `${key}: ${value}, `;
                }
                separatedText = separatedText.slice(0, -2);

                // original
                // return separatedText;
                // return the formatted paragraph to speack using open ai
                // const en = await exousiaResponse.translateText(separatedText, question);
                // return en
                console.log("objects");
                console.log(objects);
                return objects;
            }
        } else {
            return false;
        }
    } catch (error) {
        console.error(error);
    }
};

app.listen(5000, () =>
    console.log("AI server started on http://localhost:5000")
);
