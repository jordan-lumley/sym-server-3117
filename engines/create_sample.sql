CREATE TABLE public.android_log (
	    log uuid DEFAULT public.uuid_generate_v4() NOT NULL,
	    log_date timestamp without time zone,
	    device text,
	    level text,
	    message text
);
