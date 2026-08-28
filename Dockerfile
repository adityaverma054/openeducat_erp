FROM odoo:18

USER root

# Install system dependencies (Skipping complex wkhtmltopdf build issues to guarantee a smooth free deployment)
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    fontconfig \
    libfreetype6 \
    libx11-6 \
    libxcb1 \
    libxext6 \
    libxrender1 \
    xfonts-75dpi \
    xfonts-base \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

# Setup addons directory
RUN mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons
COPY --chown=odoo:odoo . /mnt/extra-addons/

# Copy configuration and entrypoint
COPY odoo.conf /etc/odoo/odoo.conf
RUN chown odoo:odoo /etc/odoo/odoo.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER odoo
EXPOSE 8069 8072
ENTRYPOINT ["/entrypoint.sh"]
