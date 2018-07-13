
"""
"""

# Native
import os
import time

# 3rd-Party
from flask import Flask, request, jsonify, send_from_directory

# Proprietary




app = Flask(__name__)


UPLOAD_DIRECTORY = '/files'

if not os.path.exists(UPLOAD_DIRECTORY):
    os.makedirs(UPLOAD_DIRECTORY)


@app.route('/')
def hello():
    """
    """

    return "hello", 200

@app.route('/files')
def files():
    """
    """

    files = []

    for filename in os.listdir(UPLOAD_DIRECTORY):
        #
        path = os.path.join(UPLOAD_DIRECTORY, filename)
        #
        if os.path.isfile(path):
            files.append(filename)

    return jsonify(files)

@app.route('/<filename>', methods=['POST'])
def upload(filename):
    """
    """

    if '/' in filename:
        return "no subdirectories directories allowed", 400

    file = request.files['file']

    path = os.path.join(UPLOAD_DIRECTORY, filename)

    file.save(path)

    return '', 201

@app.route('/<filename>', methods=['GET'])
def download(filename):
    """
    """

    return send_from_directory(UPLOAD_DIRECTORY, filename, as_attachment=True)

@app.route('/<filename>', methods=['DELETE'])
def delete(filename):
    """
    """

    path = os.path.join(UPLOAD_DIRECTORY, filename)

    try:
        os.remove(path)
    except:
        return '', 500

    return '', 200


if __name__ == "__main__":
    app.run()
