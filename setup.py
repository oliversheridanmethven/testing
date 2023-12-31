from skbuild import setup
from setuptools import find_packages

packages_to_expose = ['binding', 'common', 'media', 'version']
# ^ These typically contain the C modules
package_dirs = {package: f"src/{package.replace('.', '/')}" for package in find_packages("src/") if any([package_base in package for package_base in packages_to_expose])}

setup(
    name="testing",
    description="a minimal example package (cpp version)",
    author="Dr Oliver Sheridan-Methven",
    # license="MIT",
    setuptools_git_versioning={"enabled": True},
    setup_requires=["setuptools-git-versioning<2"],
    install_requires=["py", "varname", "more-itertools", "haggis", "termcolor", "testfixtures", "opencv-python", "pillow", "numpy"],
    packages=package_dirs.keys(),
    package_dir=package_dirs,
    python_requires=">=3.10",
)
