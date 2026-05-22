.class public Le22/c55/s88/Vss;
.super Landroid/app/Service;


# static fields
.field public static a:Ljava/lang/String;

.field protected static final b:Ljava/lang/String;

.field private static final l:Ljava/lang/String;

.field private static m:Le22/c55/s88/o;

.field private static n:I


# instance fields
.field c:I

.field private d:Le22/c55/s88/e/b;

.field private e:Le22/c55/s88/e/i;

.field private f:Le22/c55/s88/p;

.field private g:Landroid/os/Looper;

.field private h:I

.field private i:I

.field private j:I

.field private k:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "-1"

    sput-object v0, Le22/c55/s88/Vss;->a:Ljava/lang/String;

    const-string v0, "s\u00b2\u0091\u009b\u0099hu8\u0086\u00b6|\u00c8\u007f\u0090\u0086j{\u008b\u00ab\u00b9yC\u00d2\u0086mx\u007f\u00bc\u0084\u00b6\u00ae\u00beE\u00b3\u00a0u\u00bcv\u0086e"

    invoke-static {v0}, Le22/c55/s88/f/f;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le22/c55/s88/Vss;->b:Ljava/lang/String;

    const-string v0, "s\u00b2\u0091\u009b\u0099hu8\u0086\u00b6|\u00c8\u007f\u0090\u0086j{\u008b\u00ab\u00b9yC\u00d2\u0086mx\u007f\u00bc\u0084\u00b3\u00b6\u00be\u007f\u009e\u00a6t\u00c75y\u00b7\u00c3s\u00b6\u00b5e"

    invoke-static {v0}, Le22/c55/s88/f/f;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le22/c55/s88/Vss;->l:Ljava/lang/String;

    const/4 v0, 0x0

    sput v0, Le22/c55/s88/Vss;->n:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    iput v0, p0, Le22/c55/s88/Vss;->h:I

    iput v0, p0, Le22/c55/s88/Vss;->i:I

    iput v0, p0, Le22/c55/s88/Vss;->j:I

    iput v0, p0, Le22/c55/s88/Vss;->k:I

    iput v0, p0, Le22/c55/s88/Vss;->c:I

    return-void
.end method

.method static synthetic a()I
    .locals 1

    sget v0, Le22/c55/s88/Vss;->n:I

    return v0
.end method

.method static synthetic a(Le22/c55/s88/Vss;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/Vss;->h:I

    return p1
.end method

.method static synthetic a(Le22/c55/s88/Vss;)Le22/c55/s88/e/i;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    return-object v0
.end method

.method private a(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 5

    if-eqz p2, :cond_2

    const-string v0, "g"

    const-string v1, "1"

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "?"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_0
    const-string v4, "&"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2
    return-object p1
.end method

.method private a(I)V
    .locals 2

    invoke-static {p0}, Le22/c55/s88/f/a;->i(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    iput-object v0, v1, Le22/c55/s88/e/i;->n:Ljava/lang/String;

    :cond_0
    invoke-static {p0}, Le22/c55/s88/f/a;->s(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    invoke-static {p0}, Le22/c55/s88/f/a;->s(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/i;->o:Ljava/lang/String;

    :cond_1
    iget-object v0, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    invoke-static {p0}, Le22/c55/s88/e/g;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/i;->l:Ljava/lang/String;

    const/16 v0, 0xc

    if-eq p1, v0, :cond_2

    const/4 v0, 0x4

    if-ne p1, v0, :cond_3

    :cond_2
    invoke-static {p0}, Le22/c55/s88/f/a;->w(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    iput-object v0, v1, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    :goto_0
    iget-object v0, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    invoke-static {}, Le22/c55/s88/f/a;->a()I

    move-result v1

    iput v1, v0, Le22/c55/s88/e/i;->q:I

    iget-object v0, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    invoke-static {p0}, Le22/c55/s88/f/a;->h(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le22/c55/s88/e/i;->r:Ljava/lang/String;

    return-void

    :cond_3
    const/16 v0, 0xd

    if-eq p1, v0, :cond_4

    const/4 v0, 0x7

    if-ne p1, v0, :cond_5

    :cond_4
    invoke-static {p0}, Le22/c55/s88/f/a;->x(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    iput-object v0, v1, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    goto :goto_0

    :cond_5
    invoke-static {p0}, Le22/c55/s88/f/a;->f(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    iput-object v0, v1, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;I)V
    .locals 5

    invoke-static {p0}, Le22/c55/s88/Vss;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    sput p1, Le22/c55/s88/Vss;->n:I

    sget-object v0, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Le22/c55/s88/f/e;->cF:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x7530

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Le22/c55/s88/n;

    invoke-direct {v2, p1, p0}, Le22/c55/s88/n;-><init>(ILandroid/content/Context;)V

    int-to-long v3, v0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    sget v0, Le22/c55/s88/Vss;->n:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-static {p0, p1}, Le22/c55/s88/Vss;->b(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method static synthetic a(Le22/c55/s88/Vss;Z)V
    .locals 0

    invoke-direct {p0, p1}, Le22/c55/s88/Vss;->a(Z)V

    return-void
.end method

.method public static a(Le22/c55/s88/o;)V
    .locals 0

    sput-object p0, Le22/c55/s88/Vss;->m:Le22/c55/s88/o;

    return-void
.end method

.method private a(Z)V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Le22/c55/s88/f/a;->b(J)V

    :cond_0
    move v1, v0

    :goto_0
    if-nez v0, :cond_5

    if-ge v1, v7, :cond_5

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    const-string v3, "mounted"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-direct {p0}, Le22/c55/s88/Vss;->b()Z

    move-result v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "p req result "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le22/c55/s88/f/g;->a(Ljava/lang/Object;)V

    if-nez v0, :cond_1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    iget v2, p0, Le22/c55/s88/Vss;->h:I

    if-ne v2, v6, :cond_2

    iget-object v2, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    iget-object v2, v2, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    invoke-static {p0, v2}, Le22/c55/s88/f/a;->m(Landroid/content/Context;Ljava/lang/String;)Z

    sget-object v2, Le22/c55/s88/f/e;->ai:Ljava/lang/String;

    const/16 v3, 0x5dc

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    sget-object v2, Le22/c55/s88/Vss;->m:Le22/c55/s88/o;

    if-eqz v2, :cond_1

    sget-object v2, Le22/c55/s88/Vss;->m:Le22/c55/s88/o;

    invoke-interface {v2}, Le22/c55/s88/o;->a()V

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    const-wide/16 v2, 0x7d0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    :cond_2
    iget v2, p0, Le22/c55/s88/Vss;->h:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_3

    sget-object v2, Le22/c55/s88/Vss;->m:Le22/c55/s88/o;

    if-eqz v2, :cond_1

    sget-object v2, Le22/c55/s88/Vss;->m:Le22/c55/s88/o;

    invoke-interface {v2}, Le22/c55/s88/o;->a()V

    goto :goto_1

    :cond_3
    iget-object v2, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    iget-object v2, v2, Le22/c55/s88/e/i;->j:Ljava/lang/String;

    invoke-static {p0, v2}, Le22/c55/s88/f/a;->c(Landroid/content/Context;Ljava/lang/String;)Z

    goto :goto_1

    :cond_4
    sget-object v3, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Le22/c55/s88/f/e;->cG:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_5
    sget v0, Le22/c55/s88/Vss;->n:I

    if-eq v0, v7, :cond_6

    sget-object v0, Le22/c55/s88/f/e;->az:Ljava/lang/String;

    invoke-static {p0, v0, v6}, Le22/c55/s88/f/a;->a(Landroid/content/Context;Ljava/lang/String;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    sput v0, Le22/c55/s88/Vss;->n:I

    :cond_6
    return-void
.end method

.method private static a(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-static {p0}, Le22/c55/s88/f/a;->p(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, ""

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private a([B)[B
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    array-length v1, p1

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    new-instance v2, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v2, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v2, p1}, Ljava/util/zip/GZIPOutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v2, :cond_2

    :try_start_1
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_2
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method static synthetic b(Le22/c55/s88/Vss;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/Vss;->i:I

    return p1
.end method

.method private static b(Landroid/content/Context;I)V
    .locals 9

    const-wide/32 v4, 0x6ddd00

    const/4 v1, 0x0

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    new-instance v2, Landroid/content/Intent;

    invoke-static {p0}, Le22/c55/s88/VManager;->getMainChildReceivre(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x8000000

    invoke-static {p0, v1, v2, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v2, v7, v8}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    add-long/2addr v2, v4

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    return-void
.end method

.method private b()Z
    .locals 9

    const/4 v1, 0x1

    const/4 v2, 0x0

    sget-object v0, Le22/c55/s88/Vss;->b:Ljava/lang/String;

    iget v0, p0, Le22/c55/s88/Vss;->h:I

    if-ne v0, v1, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->bl:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Le22/c55/s88/Vss;->i:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le22/c55/s88/f/e;->bm:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Le22/c55/s88/Vss;->j:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "g"

    const-string v4, "1"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le22/c55/s88/Vss;->l:Ljava/lang/String;

    invoke-direct {p0, v3, v0}, Le22/c55/s88/Vss;->a(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v3, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    invoke-virtual {v0}, Le22/c55/s88/e/i;->a()V

    :try_start_0
    new-instance v0, Lorg/apache/http/entity/ByteArrayEntity;

    iget-object v4, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    invoke-virtual {v4}, Le22/c55/s88/e/i;->b()[B

    move-result-object v4

    invoke-direct {p0, v4}, Le22/c55/s88/Vss;->a([B)[B

    move-result-object v4

    invoke-direct {v0, v4}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    :goto_1
    :try_start_1
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-interface {v0, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    sget-object v5, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Le22/c55/s88/f/e;->cH:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_3

    :try_start_2
    invoke-static {p0}, Le22/c55/s88/f/a;->e(Landroid/content/Context;)V

    iget-object v2, p0, Le22/c55/s88/Vss;->d:Le22/c55/s88/e/b;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    iget-object v3, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    iget v3, v3, Le22/c55/s88/e/i;->m:I

    invoke-virtual {v2, v0, v3}, Le22/c55/s88/e/b;->a(Ljava/io/InputStream;I)V
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move v0, v1

    :goto_2
    return v0

    :cond_0
    iget v0, p0, Le22/c55/s88/Vss;->h:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->bn:Ljava/lang/String;

    const-string v4, "1"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le22/c55/s88/f/e;->bm:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Le22/c55/s88/Vss;->k:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "g"

    const-string v4, "1"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le22/c55/s88/f/e;->bl:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Le22/c55/s88/Vss;->i:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le22/c55/s88/Vss;->l:Ljava/lang/String;

    invoke-direct {p0, v3, v0}, Le22/c55/s88/Vss;->a(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_1
    sget-object v0, Le22/c55/s88/Vss;->a:Ljava/lang/String;

    const-string v3, "-1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v3, Le22/c55/s88/f/e;->bo:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Le22/c55/s88/Vss;->a:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "g"

    const-string v4, "1"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le22/c55/s88/Vss;->b:Ljava/lang/String;

    invoke-direct {p0, v3, v0}, Le22/c55/s88/Vss;->a(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "-1"

    sput-object v3, Le22/c55/s88/Vss;->a:Ljava/lang/String;

    goto/16 :goto_0

    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v3, "g"

    const-string v4, "1"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Le22/c55/s88/Vss;->b:Ljava/lang/String;

    invoke-direct {p0, v3, v0}, Le22/c55/s88/Vss;->a(Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_3
    :try_start_3
    invoke-virtual {v3}, Lorg/apache/http/client/methods/HttpPost;->abort()V
    :try_end_3
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move v0, v2

    goto/16 :goto_2

    :catch_0
    move-exception v0

    move-object v1, v0

    move v0, v2

    :goto_3
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto/16 :goto_2

    :catch_1
    move-exception v0

    move-object v1, v0

    move v0, v2

    :goto_4
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_2

    :catch_2
    move-exception v0

    move v0, v2

    goto/16 :goto_2

    :catch_3
    move-exception v0

    move v0, v1

    goto/16 :goto_2

    :catch_4
    move-exception v0

    move-object v8, v0

    move v0, v1

    move-object v1, v8

    goto :goto_4

    :catch_5
    move-exception v0

    move-object v8, v0

    move v0, v1

    move-object v1, v8

    goto :goto_3

    :catch_6
    move-exception v0

    goto/16 :goto_1
.end method

.method static synthetic b(Le22/c55/s88/Vss;)Z
    .locals 1

    invoke-direct {p0}, Le22/c55/s88/Vss;->c()Z

    move-result v0

    return v0
.end method

.method static synthetic c(Le22/c55/s88/Vss;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/Vss;->j:I

    return p1
.end method

.method private c()Z
    .locals 6

    invoke-static {}, Le22/c55/s88/f/a;->c()J

    move-result-wide v0

    invoke-static {}, Le22/c55/s88/f/a;->b()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long v0, v4, v0

    const-wide/32 v4, 0xea60

    div-long/2addr v0, v4

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    sget-object v0, Le22/c55/s88/f/e;->cb:Ljava/lang/String;

    sget-object v1, Le22/c55/s88/f/e;->aF:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic d(Le22/c55/s88/Vss;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/Vss;->k:I

    return p1
.end method

.method static synthetic e(Le22/c55/s88/Vss;I)V
    .locals 0

    invoke-direct {p0, p1}, Le22/c55/s88/Vss;->a(I)V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    new-instance v0, Le22/c55/s88/e/i;

    invoke-direct {v0, p0}, Le22/c55/s88/e/i;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le22/c55/s88/Vss;->e:Le22/c55/s88/e/i;

    invoke-static {p0}, Le22/c55/s88/e/b;->a(Landroid/content/Context;)Le22/c55/s88/e/b;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/Vss;->d:Le22/c55/s88/e/b;

    iget-object v0, p0, Le22/c55/s88/Vss;->d:Le22/c55/s88/e/b;

    invoke-virtual {v0}, Le22/c55/s88/e/b;->a()V

    new-instance v0, Landroid/os/HandlerThread;

    sget-object v1, Le22/c55/s88/f/e;->cI:Ljava/lang/String;

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Le22/c55/s88/Vss;->g:Landroid/os/Looper;

    new-instance v0, Le22/c55/s88/p;

    iget-object v1, p0, Le22/c55/s88/Vss;->g:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Le22/c55/s88/p;-><init>(Le22/c55/s88/Vss;Landroid/os/Looper;)V

    iput-object v0, p0, Le22/c55/s88/Vss;->f:Le22/c55/s88/p;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/Vss;->g:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    iget-object v0, p0, Le22/c55/s88/Vss;->f:Le22/c55/s88/p;

    invoke-virtual {v0}, Le22/c55/s88/p;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput p3, v0, Landroid/os/Message;->arg1:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v1, p0, Le22/c55/s88/Vss;->f:Le22/c55/s88/p;

    invoke-virtual {v1, v0}, Le22/c55/s88/p;->sendMessage(Landroid/os/Message;)Z

    const/4 v0, 0x2

    return v0
.end method
