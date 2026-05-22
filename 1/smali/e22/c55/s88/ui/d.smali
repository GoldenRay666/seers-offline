.class public Le22/c55/s88/ui/d;
.super Landroid/view/ViewGroup;


# static fields
.field public static a:I


# instance fields
.field private b:I

.field private c:I

.field private d:I

.field private final e:F

.field private f:Le22/c55/s88/ui/a;

.field private g:Le22/c55/s88/ui/n;

.field private h:Landroid/content/Context;

.field private i:I

.field private j:I

.field private final k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:I

.field private q:Z

.field private r:Z

.field private s:Z

.field private t:Z

.field private u:Z

.field private v:Landroid/os/Handler;

.field private w:I

.field private x:I

.field private y:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Le22/c55/s88/ui/d;->a:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    iput v1, p0, Le22/c55/s88/ui/d;->b:I

    iput v1, p0, Le22/c55/s88/ui/d;->c:I

    const/4 v0, 0x2

    iput v0, p0, Le22/c55/s88/ui/d;->d:I

    const v0, 0x3f733333    # 0.95f

    iput v0, p0, Le22/c55/s88/ui/d;->e:F

    const/16 v0, 0xc8

    iput v0, p0, Le22/c55/s88/ui/d;->j:I

    const/16 v0, 0x14

    iput v0, p0, Le22/c55/s88/ui/d;->k:I

    const/16 v0, 0x5a

    iput v0, p0, Le22/c55/s88/ui/d;->l:I

    const/16 v0, 0x28

    iput v0, p0, Le22/c55/s88/ui/d;->m:I

    iput-boolean v1, p0, Le22/c55/s88/ui/d;->q:Z

    iput-boolean v2, p0, Le22/c55/s88/ui/d;->r:Z

    iput-boolean v1, p0, Le22/c55/s88/ui/d;->s:Z

    iput-boolean v2, p0, Le22/c55/s88/ui/d;->t:Z

    iput-boolean v1, p0, Le22/c55/s88/ui/d;->u:Z

    new-instance v0, Le22/c55/s88/ui/e;

    invoke-direct {v0, p0}, Le22/c55/s88/ui/e;-><init>(Le22/c55/s88/ui/d;)V

    iput-object v0, p0, Le22/c55/s88/ui/d;->v:Landroid/os/Handler;

    iput-object p1, p0, Le22/c55/s88/ui/d;->h:Landroid/content/Context;

    invoke-virtual {p0}, Le22/c55/s88/ui/d;->a()V

    return-void
.end method

.method static synthetic a(Le22/c55/s88/ui/d;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/d;->n:I

    return v0
.end method

.method static synthetic a(Le22/c55/s88/ui/d;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/ui/d;->p:I

    return p1
.end method

.method static synthetic a(Le22/c55/s88/ui/d;Z)Z
    .locals 0

    iput-boolean p1, p0, Le22/c55/s88/ui/d;->s:Z

    return p1
.end method

.method static synthetic b(Le22/c55/s88/ui/d;I)I
    .locals 0

    iput p1, p0, Le22/c55/s88/ui/d;->d:I

    return p1
.end method

.method static synthetic b(Le22/c55/s88/ui/d;)Le22/c55/s88/ui/a;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    return-object v0
.end method

.method static synthetic c(Le22/c55/s88/ui/d;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/d;->d:I

    return v0
.end method

.method static synthetic d(Le22/c55/s88/ui/d;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/d;->p:I

    return v0
.end method

.method static synthetic e(Le22/c55/s88/ui/d;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/d;->m:I

    return v0
.end method

.method static synthetic f(Le22/c55/s88/ui/d;)Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/d;->v:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic g(Le22/c55/s88/ui/d;)I
    .locals 1

    iget v0, p0, Le22/c55/s88/ui/d;->l:I

    return v0
.end method


# virtual methods
.method public a()V
    .locals 4

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    sput v0, Le22/c55/s88/ui/d;->a:I

    iget-object v0, p0, Le22/c55/s88/ui/d;->h:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v1, p0, Le22/c55/s88/ui/d;->n:I

    iput v0, p0, Le22/c55/s88/ui/d;->o:I

    iget-object v0, p0, Le22/c55/s88/ui/d;->h:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->n(Landroid/content/Context;)I

    move-result v0

    div-int/lit8 v0, v0, 0x5

    iput v0, p0, Le22/c55/s88/ui/d;->l:I

    iget-object v0, p0, Le22/c55/s88/ui/d;->h:Landroid/content/Context;

    invoke-static {v0}, Le22/c55/s88/f/a;->n(Landroid/content/Context;)I

    move-result v0

    div-int/lit8 v0, v0, 0xa

    iput v0, p0, Le22/c55/s88/ui/d;->m:I

    iget v0, p0, Le22/c55/s88/ui/d;->n:I

    int-to-double v0, v0

    const-wide/high16 v2, 0x4014000000000000L    # 5.0

    div-double/2addr v0, v2

    double-to-int v0, v0

    iput v0, p0, Le22/c55/s88/ui/d;->j:I

    return-void
.end method

.method public a(I)V
    .locals 5

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v4, 0x0

    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    invoke-virtual {v0}, Le22/c55/s88/ui/a;->a()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget v1, p0, Le22/c55/s88/ui/d;->d:I

    if-nez v1, :cond_4

    if-lez v0, :cond_1

    iget v0, p0, Le22/c55/s88/ui/d;->c:I

    if-eq v0, v2, :cond_0

    iput v2, p0, Le22/c55/s88/ui/d;->c:I

    :cond_0
    iget-object v0, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    invoke-virtual {v0}, Le22/c55/s88/ui/a;->a()Landroid/view/View;

    move-result-object v0

    neg-int v1, p1

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    sub-int/2addr v2, p1

    iget v3, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    :goto_1
    return-void

    :cond_1
    if-gez v0, :cond_3

    iget v0, p0, Le22/c55/s88/ui/d;->c:I

    if-eq v0, v3, :cond_2

    iput v3, p0, Le22/c55/s88/ui/d;->c:I

    :cond_2
    iget-object v0, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_3
    iput v4, p0, Le22/c55/s88/ui/d;->c:I

    goto :goto_0

    :cond_4
    iget v0, p0, Le22/c55/s88/ui/d;->n:I

    int-to-float v0, v0

    const v1, 0x3f733333    # 0.95f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iget v1, p0, Le22/c55/s88/ui/d;->d:I

    if-ne v1, v2, :cond_5

    mul-int/lit8 v0, v0, -0x1

    :cond_5
    add-int/2addr v0, p1

    iget-object v1, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    invoke-virtual {v1}, Le22/c55/s88/ui/a;->a()Landroid/view/View;

    move-result-object v1

    neg-int v2, v0

    iget v3, p0, Le22/c55/s88/ui/d;->n:I

    sub-int v0, v3, v0

    iget v3, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v1, v2, v4, v0, v3}, Landroid/view/View;->layout(IIII)V

    goto :goto_1
.end method

.method public a(Le22/c55/s88/ui/a;Le22/c55/s88/ui/n;I)V
    .locals 3

    const/4 v2, 0x1

    iput p3, p0, Le22/c55/s88/ui/d;->i:I

    iget-object v0, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    if-nez v0, :cond_0

    iput-object p2, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    iget-object v0, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Le22/c55/s88/ui/d;->addView(Landroid/view/View;)V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    if-nez v0, :cond_2

    iget-object v0, p1, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {p0, v0}, Le22/c55/s88/ui/d;->addView(Landroid/view/View;)V

    :goto_0
    iput-object p1, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget-boolean v0, p0, Le22/c55/s88/ui/d;->r:Z

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Le22/c55/s88/ui/d;->q:Z

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Le22/c55/s88/ui/d;->a(ZI)V

    :goto_1
    iget-boolean v0, p0, Le22/c55/s88/ui/d;->q:Z

    if-nez v0, :cond_1

    iput-boolean v2, p0, Le22/c55/s88/ui/d;->q:Z

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget-object v0, v0, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {p0, v0}, Le22/c55/s88/ui/d;->removeView(Landroid/view/View;)V

    iget-object v0, p1, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {p0, v0}, Le22/c55/s88/ui/d;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_3
    iput-boolean v2, p0, Le22/c55/s88/ui/d;->r:Z

    goto :goto_1
.end method

.method public a(Z)V
    .locals 6

    const/4 v5, 0x0

    if-nez p1, :cond_0

    iget v0, p0, Le22/c55/s88/ui/d;->n:I

    int-to-float v0, v0

    const v1, 0x3f733333    # 0.95f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v1}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    sub-int/2addr v2, v0

    iget v3, p0, Le22/c55/s88/ui/d;->n:I

    iget v4, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/view/View;->layout(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    invoke-virtual {v1}, Le22/c55/s88/ui/a;->a()Landroid/view/View;

    move-result-object v1

    neg-int v2, v0

    iget v3, p0, Le22/c55/s88/ui/d;->n:I

    sub-int v0, v3, v0

    iget v3, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v1, v2, v5, v0, v3}, Landroid/view/View;->layout(IIII)V

    const/4 v0, 0x2

    iput v0, p0, Le22/c55/s88/ui/d;->d:I

    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget v1, p0, Le22/c55/s88/ui/d;->d:I

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/a;->a(I)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Le22/c55/s88/ui/d;->v:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/ui/f;

    invoke-direct {v1, p0}, Le22/c55/s88/ui/f;-><init>(Le22/c55/s88/ui/d;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public a(ZI)V
    .locals 5

    const/4 v4, 0x0

    if-nez p1, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget v0, p0, Le22/c55/s88/ui/d;->n:I

    int-to-float v0, v0

    const v1, 0x3f733333    # 0.95f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    invoke-virtual {v1}, Le22/c55/s88/ui/a;->a()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    iget v3, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v1}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    sub-int v0, v2, v0

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    iget v3, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    iput v4, p0, Le22/c55/s88/ui/d;->d:I

    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget v1, p0, Le22/c55/s88/ui/d;->d:I

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/a;->a(I)V

    :goto_0
    return-void

    :cond_0
    iput p2, p0, Le22/c55/s88/ui/d;->p:I

    iget-object v0, p0, Le22/c55/s88/ui/d;->v:Landroid/os/Handler;

    new-instance v1, Le22/c55/s88/ui/g;

    invoke-direct {v1, p0}, Le22/c55/s88/ui/g;-><init>(Le22/c55/s88/ui/d;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public b()V
    .locals 2

    const/4 v1, 0x1

    iget v0, p0, Le22/c55/s88/ui/d;->d:I

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Le22/c55/s88/ui/d;->a(Z)V

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v1, v0}, Le22/c55/s88/ui/d;->a(ZI)V

    goto :goto_0
.end method

.method public c()Z
    .locals 1

    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    invoke-virtual {v0}, Le22/c55/s88/ui/a;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public d()Z
    .locals 2

    const/4 v0, 0x1

    iget-boolean v1, p0, Le22/c55/s88/ui/d;->u:Z

    if-nez v1, :cond_0

    iget v1, p0, Le22/c55/s88/ui/d;->d:I

    if-nez v1, :cond_0

    invoke-virtual {p0}, Le22/c55/s88/ui/d;->b()V

    iput-boolean v0, p0, Le22/c55/s88/ui/d;->u:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    const/16 v6, 0xa

    const/4 v5, 0x2

    const/4 v1, 0x1

    const/4 v0, 0x0

    sget-boolean v2, Le22/c55/s88/g/g;->a:Z

    if-eqz v2, :cond_1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-boolean v2, p0, Le22/c55/s88/ui/d;->t:Z

    if-eqz v2, :cond_0

    :try_start_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    packed-switch v2, :pswitch_data_0

    :cond_2
    :goto_1
    move v0, v1

    goto :goto_0

    :pswitch_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    float-to-int v0, v4

    iput v0, p0, Le22/c55/s88/ui/d;->x:I

    const/4 v0, 0x0

    iput v0, p0, Le22/c55/s88/ui/d;->p:I

    iget v0, p0, Le22/c55/s88/ui/d;->b:I

    if-nez v0, :cond_2

    const/4 v0, 0x1

    iput v0, p0, Le22/c55/s88/ui/d;->b:I

    float-to-int v0, v3

    iput v0, p0, Le22/c55/s88/ui/d;->w:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/ui/d;->y:Z

    const/4 v0, 0x0

    iput v0, p0, Le22/c55/s88/ui/d;->c:I
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0

    :pswitch_1
    float-to-int v2, v4

    float-to-int v3, v3

    :try_start_1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    iget-boolean v4, p0, Le22/c55/s88/ui/d;->y:Z

    if-nez v4, :cond_5

    iget v4, p0, Le22/c55/s88/ui/d;->x:I

    sub-int/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget v4, p0, Le22/c55/s88/ui/d;->w:I

    sub-int v4, v3, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-le v2, v4, :cond_3

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0

    :cond_3
    iget v2, p0, Le22/c55/s88/ui/d;->w:I

    sub-int/2addr v2, v3

    if-gt v2, v6, :cond_4

    iget v2, p0, Le22/c55/s88/ui/d;->w:I

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-le v2, v6, :cond_5

    iget v2, p0, Le22/c55/s88/ui/d;->d:I

    if-ne v2, v5, :cond_5

    :cond_4
    const/4 v2, 0x1

    iput-boolean v2, p0, Le22/c55/s88/ui/d;->y:Z

    :cond_5
    iget-boolean v2, p0, Le22/c55/s88/ui/d;->y:Z

    if-eqz v2, :cond_2

    iget v2, p0, Le22/c55/s88/ui/d;->b:I

    if-ne v2, v1, :cond_0

    iget v2, p0, Le22/c55/s88/ui/d;->w:I

    sub-int/2addr v2, v3

    if-gez v2, :cond_6

    iget v4, p0, Le22/c55/s88/ui/d;->d:I

    if-eqz v4, :cond_0

    :cond_6
    iget v4, p0, Le22/c55/s88/ui/d;->w:I

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-le v3, v6, :cond_0

    iget-object v3, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget-object v3, v3, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    const/4 v3, 0x1

    iput-boolean v3, p0, Le22/c55/s88/ui/d;->y:Z

    if-lez v2, :cond_7

    iget v3, p0, Le22/c55/s88/ui/d;->d:I

    if-ne v3, v5, :cond_7

    const/4 v0, 0x0

    iput-boolean v0, p0, Le22/c55/s88/ui/d;->y:Z
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    goto/16 :goto_1

    :catch_1
    move-exception v0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto/16 :goto_0

    :cond_7
    :try_start_2
    iget-object v1, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Le22/c55/s88/ui/a;->a(Z)V

    invoke-virtual {p0, v2}, Le22/c55/s88/ui/d;->a(I)V
    :try_end_2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    :catch_2
    move-exception v0

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto/16 :goto_0

    :pswitch_2
    :try_start_3
    iget-object v2, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Le22/c55/s88/ui/a;->a(Z)V

    iget v2, p0, Le22/c55/s88/ui/d;->b:I

    if-ne v2, v1, :cond_9

    iget-boolean v2, p0, Le22/c55/s88/ui/d;->y:Z

    if-eqz v2, :cond_d

    float-to-int v0, v3

    iget v2, p0, Le22/c55/s88/ui/d;->w:I

    sub-int v0, v2, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v2, 0x32

    if-lt v0, v2, :cond_b

    iget v0, p0, Le22/c55/s88/ui/d;->d:I

    if-nez v0, :cond_a

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le22/c55/s88/ui/d;->a(Z)V

    :cond_8
    :goto_2
    const/4 v0, 0x0

    iput v0, p0, Le22/c55/s88/ui/d;->c:I

    :cond_9
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    const/4 v0, 0x0

    iput v0, p0, Le22/c55/s88/ui/d;->b:I

    goto/16 :goto_1

    :cond_a
    iget v0, p0, Le22/c55/s88/ui/d;->n:I

    iget-object v2, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget-object v2, v2, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    sub-int/2addr v0, v2

    const/4 v0, 0x1

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    iget-object v3, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget-object v3, v3, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0, v0, v2}, Le22/c55/s88/ui/d;->a(ZI)V

    goto :goto_2

    :cond_b
    iget v0, p0, Le22/c55/s88/ui/d;->d:I

    if-nez v0, :cond_c

    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Le22/c55/s88/ui/d;->a(ZI)V

    :cond_c
    iget v0, p0, Le22/c55/s88/ui/d;->d:I

    if-ne v0, v5, :cond_8

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le22/c55/s88/ui/d;->a(Z)V

    goto :goto_2

    :cond_d
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    const/4 v1, 0x0

    iput v1, p0, Le22/c55/s88/ui/d;->b:I
    :try_end_3
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 5

    const/4 v4, 0x0

    iget v0, p0, Le22/c55/s88/ui/d;->c:I

    if-nez v0, :cond_0

    iget v0, p0, Le22/c55/s88/ui/d;->d:I

    if-nez v0, :cond_1

    iget v0, p0, Le22/c55/s88/ui/d;->n:I

    int-to-float v0, v0

    const v1, 0x3f733333    # 0.95f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    invoke-virtual {v1}, Le22/c55/s88/ui/a;->a()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    iget v3, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    iget-object v1, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v1}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    sub-int v0, v2, v0

    iget v2, p0, Le22/c55/s88/ui/d;->n:I

    iget v3, p0, Le22/c55/s88/ui/d;->o:I

    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Le22/c55/s88/ui/d;->d:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-virtual {p0, v4}, Le22/c55/s88/ui/d;->a(Z)V

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/ui/d;->f:Le22/c55/s88/ui/a;

    iget-object v0, v0, Le22/c55/s88/ui/a;->b:Landroid/view/View;

    invoke-virtual {v0, p1, p2}, Landroid/view/View;->measure(II)V

    iget-object v0, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    invoke-virtual {v0}, Le22/c55/s88/ui/n;->c()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p2}, Landroid/view/View;->measure(II)V

    iget-object v0, p0, Le22/c55/s88/ui/d;->g:Le22/c55/s88/ui/n;

    iget v1, p0, Le22/c55/s88/ui/d;->n:I

    int-to-float v1, v1

    const v2, 0x3f733333    # 0.95f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Le22/c55/s88/ui/n;->a(I)V

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    return-void
.end method
