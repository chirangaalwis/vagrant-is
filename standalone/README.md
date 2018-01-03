# Vagrant for WSO2 Identity Server 5.3.0

This section defines the step-by-step instructions to perform a virtual machine (VM) based deployment of
WSO2 Identity Server, using Vagrant and Oracle VM VirtualBox.

Prior to the following steps, ensure that both [Vagrant](https://www.vagrantup.com/docs/installation/)
and [Oracle VM VirtualBox](https://www.virtualbox.org/manual/ch02.html) have been installed in your local machine. 

## How to deploy

##### 1. Checkout this repository into your local machine using the following git command.
```
git clone https://github.com/chirangaalwis/vagrant-wso2.git
```
>The local copy of the `Vagrantfile` directory will be referred to as `VAGRANT_HOME` from
this point onwards.

##### 2. Add JDK and WSO2 Identity Server distributions to `<VAGRANT_HOME>/files`
- Download [JDK 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) 
and copy that to `<VAGRANT_HOME>/files`.
- Download the WSO2 Identity Server 5.3.0 distribution (https://wso2.com/identity-and-access-management)
and copy that to `<VAGRANT_HOME>/files`. <br>
>Please refer to [WSO2 Update Manager documentation](https://docs.wso2.com/display/ADMIN44x/Updating+WSO2+Products)
in order to obtain latest bug fixes and updates for the product.

##### 3. Execute the Vagrant file
- Move to `VAGRANT_HOME`
- Run the `vagrant up` command to execute the `Vagrantfile`

##### 4. Accessing the management console
- To access the management console, use the static private network IP of the VM (by default, this has been set to
`192.168.0.3` in the `Vagrantfile`) and port 9443.
      + `https:<STATIC_PRIVATE_IP>:9443/carbon`
