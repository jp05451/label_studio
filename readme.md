# Table of Contents

1. [Build Label Studio and Import Data](#build-label-studio-and-import-data)
    - [Build Label Studio](#1-build-label-studio)
    - [Move Dataset](#2-move-dataset)
    - [Open Label Studio](#3-open-label-studio)
    - [Create a Project](#4-create-a-project)
    - [Create Label Template](#5-create-label-template)
    - [Add Source Storage](#6-add-source-storage)
    - [Syncing Data](#7-syncing-data)
2. [Import Pre-Annotations](#import-pre-annotations)
    - [Install Label Studio Converter](#1-install-label-studio-converter)
    - [Convert Annotations](#2-convert-annotations)
    - [Upload JSON File](#3-upload-json-file)
3. [Label Studio ML Backend](#label-studio-ml-backend)
    - [Download Label Studio ML Backend](#1-download-label-studio-ml-backend)
    - [Edit Configuration](#2-edit-configuration)
    - [Start Docker](#3-start-docker)
    - [Add Backend in Label Studio](#4-add-backend-in-label-studio)
    - [Update Labeling Interface](#5-update-labeling-interface)
    - [Annotate with ML Backend](#6-annotate-with-ml-backend)# Build Label Studio and Import Data

### 1. Build Label Studio

Build Label Studio using Docker Compose (with Nginx and PostgreSQL database):

```bash
docker compose up -d
```

### 2. Move Dataset

Move the dataset to the `mydata/datasets` directory.

### 3. Open Label Studio

Access the Label Studio web interface (default port: `8080`).

### 4. Create a Project

Create a new project in the Label Studio interface.

### 5. Create Label Template

Use the label template provided in `template.xml`.

### 6. Add Source Storage

1. Go to **Settings > Cloud Storage > Add Source Storage**.
2. Select **Local Files**.
3. Paste the dataset's absolute path.
4. Enable **"Treat every bucket object as a source file"** (important if your dataset is not in JSON format).

### 7. Syncing Data

- **Do not click "Sync"** if you already have annotations.
- If not, you can ignore this step.

---

## Import Pre-Annotations

### 1. Install Label Studio Converter

Install the `label-studio-converter` tool:

```bash
pip install label-studio-converter
```

### 2. Convert Annotations

Use `label-studio-converter` to convert annotations to Label Studio format. Example:

```bash
label-studio-converter import yolo -i $input_directory/train -o train.json --image-root-url "/data/local-files/?d=$input_directory/train/images"
```

- If you need to convert from YOLO format, refer to `yoloConverter.sh`.

### 3. Upload JSON File

Upload the JSON file using the **Import** button in the Label Studio web interface.

---

## Label Studio ML Backend

### 1. Download Label Studio ML Backend

Clone the Label Studio ML Backend repository:

```bash
git clone https://github.com/HumanSignal/label-studio-ml-backend.git
```

### 2. Edit Configuration

Edit the `docker-compose` file in `label-studio-ml/example/yourmodel`:

- Set `LABEL_STUDIO_URL=`
- Set `LABEL_STUDIO_API_KEY=`

### 3. Start Docker

Start the Docker container:

```bash
docker compose up -d
```

To use your own model or rebuild the Docker image:

```bash
docker compose up --build
```

### 4. Add Backend in Label Studio

1. Go to **Settings > Model** in the Label Studio web interface.
2. Enter your model's IP and port.

### 5. Update Labeling Interface

Add the following configuration to the labeling interface:

```html
<RectangleLabels
  name="label"
  toName="image"
  model_score_threshold="0.6"
  model_path="yolov8x.pt"
>
  <label value="Zebra-Crossing" background="rgba(218, 1, 238, 1)" />
</RectangleLabels>
```

### 6. Annotate with ML Backend

You can now annotate using the ML backend by clicking on the image you want to label.

---

## References

- [Label Studio Documentation](https://labelstud.io/guide/)
- [Label Studio ML Backend Documentation](https://github.com/HumanSignal/label-studio-ml-backend)
- [Survey-Label-Studio Documentation](https://cynthiachuang.github.io/Survey-Label-Studio/)

