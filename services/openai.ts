import { Configuration, OpenAIApi } from "openai-edge"
const configuration = new Configuration({
    organization: "org-MycL8hWSsf79BG8ZKoJmAy7f",
    apiKey: process.env.OPENAI_API_KEY,
})

export const openai = new OpenAIApi(configuration)