# The interpretation of the dockerfile

I'll explain dockerfile line by line

---

`FROM openjdk:11.0`

This is the base image, and you can choose from most of the JDK-based Docker images.

For example: `openjdk:11.0`, `openjdk:8-stretch`

---

`LABEL maintainer="haxqer <haxqer666@gmail.com>" version="8.11.0"`



---

`ARG JIRA_VERSION=8.11.0`

That's very important~~~
You can query [this site](https://www.atlassian.com/software/jira/download) for the latest version of JIRA and replace the value of JIRA_VERSION.


---

`ARG JIRA_PRODUCT=jira-software`

It doesn't matter.
You have 2 options :`jira-software` `jira-core`. Usually, choose `jira-software`.

---

