# Use the Flutter base image with the stable channel
FROM flutter:stable

# Set the working directory to /app
WORKDIR /app

# Copy the pubspec files to the working directory
COPY pubspec.* .

# Get all of the dependencies for the app
RUN flutter pub get

# Copy the rest of the app files to the working directory
COPY . .

# Build the app for release
RUN flutter build apk --release

# Expose the default port for the app
EXPOSE 3000

# Start the app
CMD ["flutter", "run", "--release", "-d", "web-server", "--web-port=3000", "--web-hostname=0.0.0.0"]
