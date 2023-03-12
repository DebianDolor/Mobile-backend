const { Configuration, OpenAIApi } = require("openai");
require("dotenv/config");

const config = new Configuration({
  apiKey: process.env.API_KEY,
});

const openai = new OpenAIApi(config);

exports.chat = async (req, res) => {
  if (!req.body.question) {
    res.status(400).send({
      message: "Content can not be empty!",
    });
    return;
  }
  const resp = await openai.createCompletion({
    model: "text-davinci-003",
    prompt: req.body.question,
    max_tokens: 2048,
    temperature: 1,
  });

  res.send(resp.data.choices[0].text);
};
