from setuptools import setup, find_packages

setup(
    include_package_data=True,
    keywords="darshan_logs",
    name="darshan_logs",
    packages=find_packages(include=["darshan_logs*"]),
    version='0.0.1',
    package_data={"": ["*.darshan"]},
)

