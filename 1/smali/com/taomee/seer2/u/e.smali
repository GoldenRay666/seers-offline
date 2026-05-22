.class public Lcom/taomee/seer2/u/e;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/io/File;

.field private static b:Ljava/io/File;

.field private static g:Lcom/taomee/seer2/u/e;


# instance fields
.field private c:Landroid/content/Context;

.field private d:I

.field private e:Lcom/taomee/seer2/u/b/f;

.field private f:Z

.field private h:Landroid/os/Handler;

.field private i:Lcom/taomee/seer2/u/k;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/taomee/seer2/u/e;->g:Lcom/taomee/seer2/u/e;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/taomee/seer2/u/e;->e:Lcom/taomee/seer2/u/b/f;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/taomee/seer2/u/e;->f:Z

    new-instance v0, Lcom/taomee/seer2/u/h;

    invoke-direct {v0, p0}, Lcom/taomee/seer2/u/h;-><init>(Lcom/taomee/seer2/u/e;)V

    iput-object v0, p0, Lcom/taomee/seer2/u/e;->h:Landroid/os/Handler;

    iput-object v1, p0, Lcom/taomee/seer2/u/e;->i:Lcom/taomee/seer2/u/k;

    iput-object p1, p0, Lcom/taomee/seer2/u/e;->c:Landroid/content/Context;

    return-void
.end method

.method static synthetic a(Lcom/taomee/seer2/u/e;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/u/e;->h:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic a(Lcom/taomee/seer2/u/e;Lcom/taomee/seer2/u/b/f;)Lcom/taomee/seer2/u/b/f;
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/u/e;->e:Lcom/taomee/seer2/u/b/f;

    return-object p1
.end method

.method public static a(Landroid/content/Context;)Lcom/taomee/seer2/u/e;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/u/e;->g:Lcom/taomee/seer2/u/e;

    if-nez v0, :cond_0

    new-instance v0, Lcom/taomee/seer2/u/e;

    invoke-direct {v0, p0}, Lcom/taomee/seer2/u/e;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/taomee/seer2/u/e;->g:Lcom/taomee/seer2/u/e;

    :cond_0
    sget-object v0, Lcom/taomee/seer2/u/e;->g:Lcom/taomee/seer2/u/e;

    return-object v0
.end method

.method static synthetic a(Ljava/io/File;)Ljava/io/File;
    .locals 0

    sput-object p0, Lcom/taomee/seer2/u/e;->a:Ljava/io/File;

    return-object p0
.end method

.method static synthetic a(Lcom/taomee/seer2/u/e;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/taomee/seer2/u/e;->f:Z

    return p1
.end method

.method static synthetic b(Lcom/taomee/seer2/u/e;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/u/e;->c:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic b()Ljava/io/File;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/u/e;->a:Ljava/io/File;

    return-object v0
.end method

.method static synthetic b(Ljava/io/File;)Ljava/io/File;
    .locals 0

    sput-object p0, Lcom/taomee/seer2/u/e;->b:Ljava/io/File;

    return-object p0
.end method

.method static synthetic c(Lcom/taomee/seer2/u/e;)Lcom/taomee/seer2/u/b/f;
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/u/e;->e:Lcom/taomee/seer2/u/b/f;

    return-object v0
.end method

.method static synthetic c()Ljava/io/File;
    .locals 1

    sget-object v0, Lcom/taomee/seer2/u/e;->b:Ljava/io/File;

    return-object v0
.end method

.method static synthetic d(Lcom/taomee/seer2/u/e;)I
    .locals 1

    iget v0, p0, Lcom/taomee/seer2/u/e;->d:I

    return v0
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lcom/taomee/seer2/u/e;->i:Lcom/taomee/seer2/u/k;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/taomee/seer2/u/e;->i:Lcom/taomee/seer2/u/k;

    invoke-interface {v0}, Lcom/taomee/seer2/u/k;->a()V

    :cond_0
    return-void
.end method

.method public a(I)V
    .locals 3

    iget-object v0, p0, Lcom/taomee/seer2/u/e;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/u/l;->a(Landroid/content/Context;)Lcom/taomee/seer2/u/l;

    move-result-object v0

    invoke-virtual {v0}, Lcom/taomee/seer2/u/l;->b()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/taomee/seer2/u/e;->f:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/taomee/seer2/u/e/b;->C:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/taomee/seer2/u/e/b;->D:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/taomee/seer2/u/e;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/u/e/i;->k(Landroid/content/Context;)Z

    iput p1, p0, Lcom/taomee/seer2/u/e;->d:I

    new-instance v0, Lcom/taomee/seer2/u/f;

    invoke-direct {v0, p0, p1}, Lcom/taomee/seer2/u/f;-><init>(Lcom/taomee/seer2/u/e;I)V

    invoke-virtual {v0}, Lcom/taomee/seer2/u/f;->start()V

    goto :goto_0
.end method
