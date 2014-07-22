require 'resolv'
require 'net/http'
require 'json'
 
SCHEDULER.every '1m', :first_in => '5s' do |job|
  uri = URI.parse('http://graphite/render/?from=-2minutes&target=slurmmon.slurm-1.jobcount.max_running_one_user&target=slurmmon.slurm-1.jobcount.max_pending_one_user&target=slurmmon.slurm-1.jobcount.total_pending&target=slurmmon.slurm-1.sdiag.jobs_submitted&target=slurmmon.slurm-1.sdiag.jobs_started&target=slurmmon.slurm-1.sdiag.jobs_failed&target=slurmmon.slurm-1.sdiag.jobs_completed&target=slurmmon.slurm-1.sdiag.jobs_canceled&target=slurmmon.slurm-1.jobcount.total_running&format=json')
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  status = JSON.parse(response.body)

  status.each do |entry|
    #STDOUT.write entry
    name = entry['target']
    value = entry['datapoints'][0][0]

    #send_event(name, {title: name.split('.').last, current: value.ceil})
    send_event(name, {current: value})
  end

end
