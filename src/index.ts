import express from "express";
import child_process from "child_process"
import { promisify } from "util";

const exec = promisify(child_process.exec);

const app = express();

app.post("/nxg-solr-api/create-core/:name", async (req, res) => {
    try {
        const { stdout, stderr } = await exec(`solr create_core -c ${req.params.name} -force`);
        res.send({ stdout, stderr });

    } catch ({code, stdout, stderr}) {
        res.send({ error: code, stdout, stderr });
    }
});

app.listen(8765);
