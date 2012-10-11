require 'aws-sdk'
require 'net/dns'

Capistrano::Configuration.instance(:must_exist).load do

  def elastic_load_balancer(name, *args)

    packet = Net::DNS::Resolver.start(name)
    all_cnames= packet.answer.reject { |p| !p.instance_of? Net::DNS::RR::CNAME }
    cname = all_cnames.find { |c| c.name == "#{name}."}.cname[0..-2]

    elb = AWS::ELB.new(:access_key_id => fetch(:aws_access_key_id),
                       :secret_access_key => fetch(:aws_secret_access_key))

    load_balancer = elb.load_balancers.find { |elb| elb.dns_name == cname }
    raise "EC2 Load Balancer not found for #{name}" if load_balancer.nil?

    load_balancer.instances.each do |instance|
      hostname = instance.dns_name
      server(hostname, *args)
    end
  end

end

