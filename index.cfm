<cfsetting enablecfoutputonly="true">

<cfoutput>

<cfinclude template="css.cfm">

<h1>Block Robots v1.1.3</h1>
<p>The <tt>blockRobots()</tt> function does 2 things for you to keep search engine spiders out of your dev environments and other pages of your choosing.</p>
<ol>
	<li>If your Wheels environment is not set to <tt>production</tt>, it will return a meta &quot;robots nofollow&quot; tag instructing search engines to ignore your application.</li>
	<li>If you pass a value of <tt>true</tt> to the <tt>blockIndexing</tt> or <tt>blockFollowing</tt> arguments, it will return a meta &quot;robots nofollow&quot; tag to your specifications.</li>
</ol>

<h2>Examples</h2>
<p>The most common use is to just add a call to the end of your <tt>&lt;head&gt;</tt> tag block in <tt>views/layout.cfm</tt>:</p>
<pre>
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;title&gt;##pageTitle##&lt;/title&gt;
##blockRobots()##
&lt;/head&gt;

...
</pre>
<p>You can also create parameters that you pass on to your view in order to selectively block indexing or following activities by search spiders, even when the site is in production.
<pre>
&lt;cfsetting enablecfoutputonly=&quot;true&quot;&gt;

&lt;cfparam name=&quot;pageTitle&quot; type=&quot;string&quot;&gt;
&lt;cfparam name=&quot;blockIndexing&quot; type=&quot;boolean&quot; default=&quot;false&quot;&gt;
&lt;cfparam name=&quot;blockFollowing&quot; type=&quot;boolean&quot; default=&quot;false&quot;&gt;

&lt;cfoutput&gt;
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;title&gt;##pageTitle##&lt;/title&gt;
##blockRobots(blockIndexing=blockIndexing, blockFollowing=blockFollowing)##
&lt;/head&gt;

...
</pre>

</cfoutput>

<cfsetting enablecfoutputonly="false">