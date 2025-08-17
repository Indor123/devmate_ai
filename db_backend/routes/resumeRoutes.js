import express from "express";
import multer from "multer";
import fs from "fs";
import path from "path";

const router = express.Router();

// ---- 1. Multer Setup ----
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const uploadPath = path.join(process.cwd(), "uploads");
    if (!fs.existsSync(uploadPath)) {
      fs.mkdirSync(uploadPath);
    }
    cb(null, uploadPath);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

const upload = multer({
  storage,
  fileFilter: (req, file, cb) => {
    if (file.mimetype !== "application/pdf") {
      return cb(new Error("Only PDF resumes are allowed"));
    }
    cb(null, true);
  },
});

// ---- 2. POST /api/resume/upload ----
router.post("/upload", upload.single("resume"), async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: "No file uploaded" });
    }

    // TODO: Replace with real AI resume analysis
    const fakeAnalysis = {
      message: "Resume processed successfully",
      filename: req.file.originalname,
      skillsExtracted: ["JavaScript", "Flutter", "MongoDB"],
      jobMatchScore: 82,
    };

    res.status(200).json(fakeAnalysis);
  } catch (error) {
    console.error("Upload error:", error);
    res.status(500).json({ error: "Failed to process resume" });
  }
});

// ---- 3. Cleanup old uploads ----
router.delete("/cleanup", (req, res) => {
  try {
    const uploadPath = path.join(process.cwd(), "uploads");
    if (fs.existsSync(uploadPath)) {
      fs.readdirSync(uploadPath).forEach((file) =>
        fs.unlinkSync(path.join(uploadPath, file))
      );
    }
    res.json({ message: "Uploads cleared" });
  } catch (err) {
    res.status(500).json({ error: "Cleanup failed" });
  }
});

export default router;


