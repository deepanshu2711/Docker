import express from "express"
import dotenv from "dotenv"
dotenv.config()

const app = express()


app.get("/", (req, res) => {
  res.send("Hello Deepanshu saini!")
})

app.get("/env", (req, res) => {
  res.send(process.env.NAME)
})

app.get("/change" , (req,res) => {
  res.send("Change")
})

app.listen(3000, () => {
  console.log("Server is running on port 3000")
})