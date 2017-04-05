# create a connction 
import swiftclient
user = 'Bill'
key = 'harper'

conn = swiftclient.Connection(
        user = user,
        key = key,
        authurl='http://184.94.251.119/auth/v1.0')


# create a new container 
container_name = 'container02'
print 'creating a container %s ...' % container_name
conn.put_container(container_name)
print 'done!'
print '-----------------\n'

# upload object to container 
object_name = 'hello.txt'
print 'creating object %s in %s ...' % (object_name, container_name)
conn.put_object(container = container_name, obj = object_name, contents = 'Hello World!', content_type = 'text/plain')
print 'done!'
print '-----------------\n'

# upload object to container 
object_name2 = 'hello2.txt'
print 'creating object %s in %s ...' % (object_name2, container_name)
conn.put_object(container = container_name, obj = object_name2, contents = 'Hello CloudCenter!', content_type = 'text/plain')
print 'done!'
print '-----------------\n'

                                                                                                                   1,1           Top

# list owned containers 
print 'listing all containers:'
for container in conn.get_account()[1]:
        print container['name']
print '-----------------\n'

# list the new container's contents 
print 'listing new container content:'
for data in conn.get_container(container_name)[1]:
        print '{0}\t{1}\t{2}'.format(data['name'], data['bytes'], data['last_modified'])
print '-----------------\n'

# read object 
print 'reading object %s in %s ...\n' % (object_name, container_name)
(headers, content) = conn.get_object(container = container_name, obj = object_name)
print 'content: %s\n' % content

print 'reading object %s in %s ...\n' % (object_name2, container_name)
(headers, content) = conn.get_object(container = container_name, obj = object_name2)
print 'content: %s\n' % content

print 'done!'
print '-----------------\n'


