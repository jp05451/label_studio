import os

from roboflow import Roboflow

os.chdir("datasets")
rf = Roboflow(api_key="7MDUg9iT30ZHZKq4cOjx")
project = rf.workspace("hti02").project("ebike2.0-ednob")
version = project.version(3)
dataset = version.download("yolov8")
