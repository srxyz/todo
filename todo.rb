require 'sinatra'
require 'sinatra/reloader'

# my_list = List.new
@@tasks = Array.new

get '/' do
	str = ""
	for s in @@tasks
		str << "\t\t\t
		<tr>
			<td> 
				<div onclick='toggle(this)' class='untoggled'>
				</div>
			</td>
			<td>#{s}</td>
			<td><form method='POST' action='/post/'>
				<input value='#{s}' type='hidden' name='delete'/>
				<input type='image' class='delete' src='delete.png' alt='Submit'/>
			</form></td>
		</tr>
		\n"
	end

	str << "\t\t\t
	<tr>
		<td></td>
		<td id='closed' class='plus' onclick='expand()'>
			<div></div>
			<div></div>
		</td>
		<td></td>
		</tr>
	\n"

	str << "\t\t\t
	<tr id='hide'>
		<td></td>
		<td><form method='POST' action='/post/'>
			<input name='task' value=''/><br/>
			<input type='submit'/>
		</form></td>
		<td></td>
	</tr>
	\n"

	erb :index, :locals => {:tasks => str}
end

post '/post/' do
	if params[:task] != ""
		@@tasks << "#{params[:task]}"
	end
	if params[:delete] != ""
		@@tasks.delete(params[:delete])
		@@tasks.reject! {|s| s.empty? }
	end
	redirect '/'
end
