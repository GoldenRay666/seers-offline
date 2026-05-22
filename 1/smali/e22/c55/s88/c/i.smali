.class public Le22/c55/s88/c/i;
.super Ljava/lang/Object;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Landroid/os/Handler;

.field private c:Z

.field private d:Le22/c55/s88/c/l;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Le22/c55/s88/c/i;->b:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/c/i;->c:Z

    const/4 v0, 0x0

    iput-object v0, p0, Le22/c55/s88/c/i;->d:Le22/c55/s88/c/l;

    iput-object p1, p0, Le22/c55/s88/c/i;->a:Landroid/content/Context;

    return-void
.end method

.method static synthetic a(Le22/c55/s88/c/i;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/c/i;->a:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic a(Le22/c55/s88/c/i;Z)Z
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/c/i;->c:Z

    return p1
.end method

.method static synthetic b(Le22/c55/s88/c/i;)Le22/c55/s88/c/l;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/c/i;->d:Le22/c55/s88/c/l;

    return-object v0
.end method

.method static synthetic c(Le22/c55/s88/c/i;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/c/i;->b:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public a(Le22/c55/s88/c/l;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/c/i;->d:Le22/c55/s88/c/l;

    return-void
.end method

.method public a(Le22/c55/s88/e/j;)V
    .locals 1

    new-instance v0, Le22/c55/s88/c/j;

    invoke-direct {v0, p0, p1}, Le22/c55/s88/c/j;-><init>(Le22/c55/s88/c/i;Le22/c55/s88/e/j;)V

    invoke-virtual {v0}, Le22/c55/s88/c/j;->start()V

    return-void
.end method

.method public a()Z
    .locals 1

    iget-boolean v0, p0, Le22/c55/s88/c/i;->c:Z

    return v0
.end method
