FROM cirrusci/flutter:latest

# Mettre à jour les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y wget unzip lib32stdc++6

# Configurer le SDK Android
ENV ANDROID_SDK_ROOT=/opt/android-sdk
RUN mkdir -p $ANDROID_SDK_ROOT
RUN yes | sdkmanager --licenses

# Ajouter un utilisateur non-root pour éviter les problèmes de permissions
RUN useradd -ms /bin/bash flutteruser

# Changer les permissions pour le dossier Flutter et le SDK Android
RUN chown -R flutteruser:flutteruser /sdks/flutter
RUN chown -R flutteruser:flutteruser /opt/android-sdk-linux

# Passer à l’utilisateur non-root
USER flutteruser

# Configurer git pour que le dossier Flutter soit sûr
RUN git config --global --add safe.directory /sdks/flutter

# Définir le dossier de travail
WORKDIR /app

