# This script is designed specifically for Jenkins.  It runs the Jasmine and PHPUnit tests associated with the Pack
# script.  It also builds the Professor M module loadable package.

#If you are running Jenkins in a Docker container and mounting /var/jenkins_home to a directory on your machine's local
# filesystem (for example: /Users/lschaefer/jenkins), you may need to update LOCALWORKSPACEPATH to reflect the path on
# your local filesystem to the Jenkins workspace for your ProfessorM job
# (for example: "/Users/lschaefer/jenkins/workspace/ProfessorM"). The easiest way to update LOCALWORKSPACEPATH is to
# pass in the value as an argument when you call this script.

LOCALWORKSPACEPATH=$1

# Remove any lingering containers from previously failed builds
echo "Removing old containers from previously failed builds. 'No such container' errors can be safely ignored..."
docker rm my-yarn --force || true
docker rm my-composer --force || true

# Run the Jasmine tests
docker pull sugarcrmdev/school:yarn
docker run -t -d -v $LOCALWORKSPACEPATH:/workspace --name my-yarn sugarcrmdev/school:yarn
docker exec my-yarn sh -c "cd tests/jasmine && yarn install"
docker exec my-yarn sh -c "cd tests/jasmine && yarn global add grunt-cli"
echo "Running the Jasmine tests for PackageGenerator..."
docker exec my-yarn sh -c "cd tests/jasmine && grunt test-js"

# Run the PHPUnit tests
docker pull sugarcrmdev/school:composer
docker run -t -d -v $LOCALWORKSPACEPATH:/workspace --name my-composer sugarcrmdev/school:composer
docker exec my-composer sh -c "cd package && composer install"
echo "Running the PHPUnit tests for PackageGenerator..."
docker exec my-composer sh -c "cd tests/phpunit && ../../package/vendor/bin/phpunit"

# Generate the Standard and Windows versions Professor M module loadable package
docker exec my-composer sh -c "cd package && php ./pack.php -v jenkins"
docker exec my-composer sh -c "cd package && php ./pack.php -v jenkins -w 40"

# Remove the containers
docker rm my-yarn --force
docker rm my-composer --force
